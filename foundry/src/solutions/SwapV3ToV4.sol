// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {IERC20} from "../interfaces/IERC20.sol";
import {IUniversalRouter} from "../interfaces/IUniversalRouter.sol";
import {IV4Router} from "../interfaces/IV4Router.sol";
import {Actions} from "../libraries/Actions.sol";
import {ActionConstants} from "../libraries/ActionConstants.sol";
import {Commands} from "../libraries/Commands.sol";
import {PoolKey} from "../types/PoolKey.sol";
import {UNIVERSAL_ROUTER, POOL_MANAGER, WETH} from "../Constants.sol";

contract SwapV3ToV4 {
    IUniversalRouter constant router = IUniversalRouter(UNIVERSAL_ROUTER);

    receive() external payable {}

    // 兑换路径：代币 A -> V3 -> 代币 B -> V4 -> 代币 C
    struct V3Params {
        address tokenIn;
        address tokenOut;
        uint24 poolFee;
        uint256 amountIn;
    }

    struct V4Params {
        PoolKey key;
        uint128 amountOutMin;
    }

    function swap(V3Params calldata v3, V4Params calldata v4) external {
        // 禁用 WETH 池子，以保持代码简单
        require(
            v4.key.currency0 != WETH && v4.key.currency1 != WETH,
            "WETH pools disabled"
        );

        // 将 address(0) 映射为 WETH
        (address v4Token0, address v4Token1) =
            (v4.key.currency0, v4.key.currency1);
        if (v4Token0 == address(0)) {
            v4Token0 = WETH;
        }

        require(
            v3.tokenOut == v4Token0 || v3.tokenOut == v4Token1,
            "invalid pool key"
        );
        (address v4CurrencyIn, address v4CurrencyOut) = v3.tokenOut == v4Token0
            ? (v4.key.currency0, v4.key.currency1)
            : (v4.key.currency1, v4.key.currency0);

        // 将 v3.tokenIn 发送到 UniversalRouter
        IERC20(v3.tokenIn).transferFrom(
            msg.sender, address(router), v3.amountIn
        );

        // UniversalRouter 的命令（commands）与输入（inputs）
        bytes memory commands;
        bytes[] memory inputs;

        // 若 v3.tokenOut 为 WETH，则插入 UNWRAP_WETH 命令
        if (v3.tokenOut == WETH) {
            commands = abi.encodePacked(
                uint8(Commands.V3_SWAP_EXACT_IN),
                uint8(Commands.UNWRAP_WETH),
                uint8(Commands.V4_SWAP)
            );
        } else {
            commands = abi.encodePacked(
                uint8(Commands.V3_SWAP_EXACT_IN), uint8(Commands.V4_SWAP)
            );
        }

        inputs = new bytes[](commands.length);

        // V3_SWAP_EXACT_IN
        inputs[0] = abi.encode(
            // address recipient
            address(router),
            // uint256 amountIn - 使用 UniversalRouter 合约中锁定的 v3.tokenIn 余额
            ActionConstants.CONTRACT_BALANCE,
            // uint256 amountOutMin
            uint256(1),
            // bytes path
            abi.encodePacked(v3.tokenIn, v3.poolFee, v3.tokenOut),
            // bool payerIsUser - 用 UniversalRouter 合约中锁定的代币支付
            false
        );

        // UNWRAP_WETH
        if (v3.tokenOut == WETH) {
            inputs[1] = abi.encode(
                // 接收者，最小数量
                address(router),
                uint256(1)
            );
        }

        // V4 的操作（actions）与参数（params）
        bytes memory actions = abi.encodePacked(
            uint8(Actions.SETTLE),
            uint8(Actions.SWAP_EXACT_IN_SINGLE),
            uint8(Actions.TAKE_ALL)
        );
        bytes[] memory params = new bytes[](3);
        // SETTLE（代币，数量，付款方是否为用户）
        params[0] = abi.encode(
            v4CurrencyIn, uint256(ActionConstants.CONTRACT_BALANCE), false
        );
        // SWAP_EXACT_IN_SINGLE
        params[1] = abi.encode(
            IV4Router.ExactInputSingleParams({
                poolKey: v4.key,
                zeroForOne: v4CurrencyIn == v4.key.currency0,
                amountIn: ActionConstants.OPEN_DELTA,
                amountOutMinimum: v4.amountOutMin,
                hookData: bytes("")
            })
        );
        // TAKE_ALL（代币，最小数量）
        params[2] = abi.encode(v4CurrencyOut, uint256(v4.amountOutMin));

        // V4_SWAP
        inputs[commands.length - 1] = abi.encode(actions, params);

        router.execute(commands, inputs, block.timestamp);

        withdraw(v4CurrencyOut, msg.sender);
    }

    function withdraw(address currency, address receiver) private {
        if (currency == address(0)) {
            uint256 bal = address(this).balance;
            if (bal > 0) {
                (bool ok,) = receiver.call{value: bal}("");
                require(ok, "Transfer ETH failed");
            }
        } else {
            uint256 bal = IERC20(currency).balanceOf(address(this));
            if (bal > 0) {
                IERC20(currency).transfer(receiver, bal);
            }
        }
    }
}
