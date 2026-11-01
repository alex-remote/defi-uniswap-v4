// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @dev 两个 `int128` 值打包进一个 `int256`，其中高 128 位表示 amount0，
/// 低 128 位表示 amount1。
type BalanceDelta is int256;

/// @notice 用于从 BalanceDelta 类型中取出 amount0 与 amount1 两个 delta 的库
library BalanceDeltaLibrary {
    /// @notice 值为 0 的 BalanceDelta
    BalanceDelta public constant ZERO_DELTA = BalanceDelta.wrap(0);

    function amount0(BalanceDelta balanceDelta)
        internal
        pure
        returns (int128 _amount0)
    {
        assembly ("memory-safe") {
            _amount0 := sar(128, balanceDelta)
        }
    }

    function amount1(BalanceDelta balanceDelta)
        internal
        pure
        returns (int128 _amount1)
    {
        assembly ("memory-safe") {
            _amount1 := signextend(15, balanceDelta)
        }
    }
}
