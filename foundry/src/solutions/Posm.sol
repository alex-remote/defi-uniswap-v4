// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {IERC20} from "../interfaces/IERC20.sol";
import {IPermit2} from "../interfaces/IPermit2.sol";
import {IPositionManager} from "../interfaces/IPositionManager.sol";
import {PoolKey} from "../types/PoolKey.sol";
import {PoolId, PoolIdLibrary} from "../types/PoolId.sol";
import {Actions} from "../libraries/Actions.sol";
import {POSITION_MANAGER, USDC, PERMIT2} from "../Constants.sol";

contract PosmExercises {
    using PoolIdLibrary for PoolKey;

    IPositionManager constant posm = IPositionManager(POSITION_MANAGER);

    // 本练习中 currency0 = ETH
    constructor(address currency1) {
        IERC20(currency1).approve(PERMIT2, type(uint256).max);
        IPermit2(PERMIT2).approve(
            currency1, address(posm), type(uint160).max, type(uint48).max
        );
    }

    receive() external payable {}

    function mint(
        PoolKey calldata key,
        int24 tickLower,
        int24 tickUpper,
        uint256 liquidity
    ) external payable returns (uint256) {
        bytes memory actions = abi.encodePacked(
            uint8(Actions.MINT_POSITION),
            uint8(Actions.SETTLE_PAIR),
            uint8(Actions.SWEEP)
        );
        bytes[] memory params = new bytes[](3);

        // MINT_POSITION 的参数
        params[0] = abi.encode(
            key,
            tickLower,
            tickUpper,
            liquidity,
            // amount0Max
            type(uint128).max,
            // amount1Max
            type(uint128).max,
            // owner（头寸所有者）
            address(this),
            // hook 数据
            ""
        );

        // SETTLE_PAIR 的参数
        // 代币 0 和代币 1
        params[1] = abi.encode(address(0), USDC);

        // SWEEP 的参数
        // 代币，接收地址 to
        params[2] = abi.encode(address(0), address(this));

        uint256 tokenId = posm.nextTokenId();

        posm.modifyLiquidities{value: address(this).balance}(
            abi.encode(actions, params), block.timestamp
        );

        return tokenId;
    }

    function increaseLiquidity(
        uint256 tokenId,
        uint256 liquidity,
        uint128 amount0Max,
        uint128 amount1Max
    ) external payable {
        bytes memory actions = abi.encodePacked(
            uint8(Actions.INCREASE_LIQUIDITY),
            uint8(Actions.CLOSE_CURRENCY),
            uint8(Actions.CLOSE_CURRENCY),
            uint8(Actions.SWEEP)
        );
        bytes[] memory params = new bytes[](4);

        // INCREASE_LIQUIDITY 的参数
        params[0] = abi.encode(
            tokenId,
            liquidity,
            amount0Max,
            amount1Max,
            // hook 数据
            ""
        );

        // CLOSE_CURRENCY 的参数
        // 代币 0
        params[1] = abi.encode(address(0), USDC);

        // CLOSE_CURRENCY 的参数
        // 代币 1
        params[2] = abi.encode(USDC);

        // SWEEP 的参数
        // 代币，接收地址 to
        params[3] = abi.encode(address(0), address(this));

        posm.modifyLiquidities{value: address(this).balance}(
            abi.encode(actions, params), block.timestamp
        );
    }

    function decreaseLiquidity(
        uint256 tokenId,
        uint256 liquidity,
        uint128 amount0Min,
        uint128 amount1Min
    ) external {
        bytes memory actions = abi.encodePacked(
            uint8(Actions.DECREASE_LIQUIDITY), uint8(Actions.TAKE_PAIR)
        );
        bytes[] memory params = new bytes[](2);

        // DECREASE_LIQUIDITY 的参数
        params[0] = abi.encode(
            tokenId,
            liquidity,
            amount0Min,
            amount1Min,
            // hook 数据
            ""
        );

        // TAKE_PAIR 的参数
        // 代币 0，代币 1，接收者
        params[1] = abi.encode(address(0), USDC, address(this));

        posm.modifyLiquidities(abi.encode(actions, params), block.timestamp);
    }

    function burn(uint256 tokenId, uint128 amount0Min, uint128 amount1Min)
        external
    {
        bytes memory actions = abi.encodePacked(
            uint8(Actions.BURN_POSITION), uint8(Actions.TAKE_PAIR)
        );
        bytes[] memory params = new bytes[](2);

        // BURN_POSITION 的参数
        params[0] = abi.encode(
            tokenId,
            amount0Min,
            amount1Min,
            // hook 数据
            ""
        );

        // TAKE_PAIR 的参数
        // 代币 0，代币 1，接收者
        params[1] = abi.encode(address(0), USDC, address(this));

        posm.modifyLiquidities(abi.encode(actions, params), block.timestamp);
    }
}
