// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @notice 某个地址解锁 PoolManager 时所执行的回调的接口
interface IUnlockCallback {
    /// @notice 当 PoolManager 被解锁时，由 PoolManager 在 `msg.sender` 上调用
    /// @param data 调用 unlock 时传入的数据
    /// @return 任何你希望由 unlock 调用返回的数据
    function unlockCallback(bytes calldata data)
        external
        returns (bytes memory);
}
