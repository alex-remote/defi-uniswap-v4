// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

// beforeSwap hook 的返回类型。
// 高 128 位是指定代币（specified）的 delta，低 128 位是非指定代币（unspecified）的 delta（以便与 afterSwap hook 保持一致）
type BeforeSwapDelta is int256;

// 由 specified 与 unspecified 两个 delta 构造一个 BeforeSwapDelta
function toBeforeSwapDelta(int128 deltaSpecified, int128 deltaUnspecified)
    pure
    returns (BeforeSwapDelta beforeSwapDelta)
{
    assembly ("memory-safe") {
        beforeSwapDelta :=
            or(shl(128, deltaSpecified), and(sub(shl(128, 1), 1), deltaUnspecified))
    }
}

/// @notice 用于从 BeforeSwapDelta 类型中取出 specified 与 unspecified 两个 delta 的库
library BeforeSwapDeltaLibrary {
    /// @notice 值为 0 的 BeforeSwapDelta
    BeforeSwapDelta public constant ZERO_DELTA = BeforeSwapDelta.wrap(0);

    /// 从 BeforeSwapDelta 的高 128 位中提取 int128
    /// （该 BeforeSwapDelta 由 beforeSwap 返回）
    function getSpecifiedDelta(BeforeSwapDelta delta)
        internal
        pure
        returns (int128 deltaSpecified)
    {
        assembly ("memory-safe") {
            deltaSpecified := sar(128, delta)
        }
    }

    /// 从 BeforeSwapDelta 的低 128 位中提取 int128
    /// （该值由 beforeSwap 和 afterSwap 返回）
    function getUnspecifiedDelta(BeforeSwapDelta delta)
        internal
        pure
        returns (int128 deltaUnspecified)
    {
        assembly ("memory-safe") {
            deltaUnspecified := signextend(15, delta)
        }
    }
}
