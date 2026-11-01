// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @notice 用于定义各种池子操作（action）的库。
/// @dev 这些是建议使用的通用命令，如有需要应另行定义其他命令
/// 其中部分操作在 Router 合约或 Position Manager 合约中并不支持，但仍予以保留，因为它们可能对其他外围合约有用。
library Actions {
    // 池子操作
    // 流动性操作
    uint256 internal constant INCREASE_LIQUIDITY = 0x00;
    uint256 internal constant DECREASE_LIQUIDITY = 0x01;
    uint256 internal constant MINT_POSITION = 0x02;
    uint256 internal constant BURN_POSITION = 0x03;
    uint256 internal constant INCREASE_LIQUIDITY_FROM_DELTAS = 0x04;
    uint256 internal constant MINT_POSITION_FROM_DELTAS = 0x05;

    // 兑换
    uint256 internal constant SWAP_EXACT_IN_SINGLE = 0x06;
    uint256 internal constant SWAP_EXACT_IN = 0x07;
    uint256 internal constant SWAP_EXACT_OUT_SINGLE = 0x08;
    uint256 internal constant SWAP_EXACT_OUT = 0x09;

    // 捐赠（donate）
    // 注意：PositionManager 和 Router 均不支持此操作
    uint256 internal constant DONATE = 0x0a;

    // 结清 PoolManager 上的 delta
    // 结算（settle）
    uint256 internal constant SETTLE = 0x0b;
    uint256 internal constant SETTLE_ALL = 0x0c;
    uint256 internal constant SETTLE_PAIR = 0x0d;
    // 提取（take）
    uint256 internal constant TAKE = 0x0e;
    uint256 internal constant TAKE_ALL = 0x0f;
    uint256 internal constant TAKE_PORTION = 0x10;
    uint256 internal constant TAKE_PAIR = 0x11;

    uint256 internal constant CLOSE_CURRENCY = 0x12;
    uint256 internal constant CLEAR_OR_TAKE = 0x13;
    uint256 internal constant SWEEP = 0x14;

    uint256 internal constant WRAP = 0x15;
    uint256 internal constant UNWRAP = 0x16;

    // 通过铸造/销毁 ERC6909 代币来结清 delta
    // 注意：PositionManager 和 Router 均不支持此操作
    uint256 internal constant MINT_6909 = 0x17;
    uint256 internal constant BURN_6909 = 0x18;
}
