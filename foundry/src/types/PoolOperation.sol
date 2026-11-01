// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @notice `ModifyLiquidity` 池子操作的参数结构体
struct ModifyLiquidityParams {
    // 头寸的下界 tick 与上界 tick
    int24 tickLower;
    int24 tickUpper;
    // 如何修改流动性（流动性的变化量）
    int256 liquidityDelta;
    // 若想在相同价格区间内拥有互不相同的流动性头寸，就设置此值
    bytes32 salt;
}

/// @notice `Swap` 池子操作的参数结构体
struct SwapParams {
    /// 是用 token0 换 token1，还是反过来
    bool zeroForOne;
    /// 为负时表示期望的输入数量（exactIn），为正时表示期望的输出数量（exactOut）
    int256 amountSpecified;
    /// 平方根价格限制：价格一旦到达该值，兑换就会停止执行
    uint160 sqrtPriceLimitX96;
}
