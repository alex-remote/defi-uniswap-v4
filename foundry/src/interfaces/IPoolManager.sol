// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {IExtsload} from "./IExtsload.sol";
import {IExttload} from "./IExttload.sol";
import {PoolKey} from "../types/PoolKey.sol";
import {ModifyLiquidityParams, SwapParams} from "../types/PoolOperation.sol";

interface IPoolManager is IExtsload, IExttload {
    /// @notice 当合约解锁结束后仍有代币未结清（净 delta 不为零）时抛出
    error CurrencyNotSettled();

    /// @notice 当尝试与未初始化的池子交互时抛出
    error PoolNotInitialized();

    /// @notice 当调用 unlock 但合约已处于解锁状态时抛出
    error AlreadyUnlocked();

    /// @notice 当调用了要求合约处于解锁状态的函数、但合约并未解锁时抛出
    error ManagerLocked();

    /// @notice 在 #initialize 中，池子的 tickSpacing 最大限制为 type(int16).max，以防止溢出
    error TickSpacingTooLarge(int24 tickSpacing);

    /// @notice 传给 #initialize 的池子 tickSpacing 必须为非零正数
    error TickSpacingTooSmall(int24 tickSpacing);

    /// @notice PoolKey 中的代币必须满足 address(currency0) < address(currency1)
    error CurrenciesOutOfOrderOrEqual(address currency0, address currency1);

    /// @notice 当 updateDynamicLPFee 的调用者不是该池子的 hook 地址，
    /// 或目标池子没有启用动态兑换手续费时抛出。
    error UnauthorizedDynamicLPFeeUpdate();

    /// @notice 当尝试兑换的数量为 0 时抛出
    error SwapAmountCannotBeZero();

    ///@notice 当向非原生代币的结算传入原生代币时抛出
    error NonzeroNativeValue();

    /// @notice 当调用 `clear` 时传入的数量不完全等于该代币尚未结清的 delta 时抛出。
    error MustClearExactPositiveDelta();

    function unlock(bytes calldata data) external returns (bytes memory);

    function initialize(PoolKey memory key, uint160 sqrtPriceX96)
        external
        returns (int24 tick);

    function modifyLiquidity(
        PoolKey memory key,
        ModifyLiquidityParams memory params,
        bytes calldata hookData
    ) external returns (int256 callerDelta, int256 feesAccrued);

    function swap(
        PoolKey memory key,
        SwapParams memory params,
        bytes calldata hookData
    ) external returns (int256 swapDelta);

    function donate(
        PoolKey memory key,
        uint256 amount0,
        uint256 amount1,
        bytes calldata hookData
    ) external returns (int256);

    function sync(address currency) external;

    function take(address currency, address to, uint256 amount) external;

    function settle() external payable returns (uint256 paid);

    function settleFor(address recipient)
        external
        payable
        returns (uint256 paid);

    function clear(address currency, uint256 amount) external;

    function mint(address to, uint256 id, uint256 amount) external;

    function burn(address from, uint256 id, uint256 amount) external;

    function updateDynamicLPFee(PoolKey memory key, uint24 newDynamicLPFee)
        external;
}
