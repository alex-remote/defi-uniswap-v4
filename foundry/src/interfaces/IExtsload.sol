// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @notice 用于访问合约中任意存储槽（storage slot）的函数接口
interface IExtsload {
    /// @notice 供外部合约调用，用于访问细粒度的池子状态
    /// @param slot 要 sload 的槽的键
    /// @return value 该槽的值，类型为 bytes32
    function extsload(bytes32 slot) external view returns (bytes32 value);

    /// @notice 供外部合约调用，用于访问细粒度的池子状态
    /// @param startSlot 开始 sload 的起始槽的键
    /// @param nSlots 要加载到返回值中的槽数量
    /// @return values 加载出的值列表。
    function extsload(bytes32 startSlot, uint256 nSlots)
        external
        view
        returns (bytes32[] memory values);

    /// @notice 供外部合约调用，用于访问稀疏（不连续）的池子状态
    /// @param slots 要 SLOAD 的槽列表。
    /// @return values 加载出的值列表。
    function extsload(bytes32[] calldata slots)
        external
        view
        returns (bytes32[] memory values);
}
