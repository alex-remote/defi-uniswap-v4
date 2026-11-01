// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.30;

interface IUniversalRouter {
    /// @notice 当某条必须成功的命令执行失败时抛出
    error ExecutionFailed(uint256 commandIndex, bytes message);

    /// @notice 当尝试直接向合约发送 ETH 时抛出
    error ETHNotAccepted();

    /// @notice 当执行命令时截止时间（deadline）已过期时抛出
    error TransactionDeadlinePassed();

    /// @notice 当执行命令时提供的输入数量不正确时抛出
    error LengthMismatch();

    // @notice 当非 WETH 地址在不带 calldata 的情况下向路由合约发送 ETH 时抛出
    error InvalidEthSender();

    /// @notice 使用提供的输入执行编码后的命令。若截止时间已过则 revert。
    /// @param commands 一组拼接在一起的命令，每条命令长 1 字节
    /// @param inputs 字节串数组，包含每条命令经 abi 编码的输入
    /// @param deadline 交易必须在此截止时间之前执行
    function execute(
        bytes calldata commands,
        bytes[] calldata inputs,
        uint256 deadline
    ) external payable;
}
