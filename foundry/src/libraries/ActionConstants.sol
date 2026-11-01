// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @title 操作常量（Action Constants）
/// @notice 各操作（action）中使用的通用常量
/// @dev 用常量代替其字面值，可以更节省 gas
library ActionConstants {
    /// @notice 用于表示某个操作应以 PoolManager 上未结清的 delta（open delta）
    /// 或合约所持有的余额作为输入值
    uint128 internal constant OPEN_DELTA = 0;
    /// @notice 用于表示某个操作应使用合约持有的某种代币的全部余额
    /// 该值等于 1<<255，即仅最高有效位为 1。
    uint256 internal constant CONTRACT_BALANCE =
        0x8000000000000000000000000000000000000000000000000000000000000000;

    /// @notice 用于表示某个操作的接收者应为 msgSender
    address internal constant MSG_SENDER = address(1);

    /// @notice 用于表示某个操作的接收者应为 address(this)
    address internal constant ADDRESS_THIS = address(2);
}
