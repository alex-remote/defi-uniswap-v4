// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @notice 用于访问合约中任意瞬态存储（transient storage）槽的函数接口
interface IExttload {
    /// @notice 供外部合约调用，用于访问本合约的瞬态存储
    /// @param slot 要 tload 的槽的键
    /// @return value 该槽的值，类型为 bytes32
    function exttload(bytes32 slot) external view returns (bytes32 value);

    /// @notice 供外部合约调用，用于访问稀疏（不连续）的池子瞬态状态
    /// @param slots 要 tload 的槽列表
    /// @return values 加载出的值列表
    function exttload(bytes32[] calldata slots)
        external
        view
        returns (bytes32[] memory values);
}
