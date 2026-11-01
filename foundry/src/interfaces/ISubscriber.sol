// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

// BalanceDelta = int256
// PositionInfo = uint256

/// @title ISubscriber
/// @notice Subscriber 合约应实现的接口，用于接收来自 V4 PositionManager 的更新
interface ISubscriber {
    /// @notice 当某个头寸订阅本订阅者合约时调用
    /// @param tokenId 头寸的 token ID
    /// @param data 调用者传入的附加数据
    function notifySubscribe(uint256 tokenId, bytes memory data) external;

    /// @notice 当某个头寸取消订阅该订阅者时调用
    /// @dev 此调用的 gas 上限为 `unsubscribeGasLimit`（部署时设定）
    /// @dev 由于 EIP-150，solidity 可能只会分配 gasleft() 的 63/64
    /// @param tokenId 头寸的 token ID
    function notifyUnsubscribe(uint256 tokenId) external;

    /// @notice 当头寸被销毁时调用
    /// @param tokenId 头寸的 token ID
    /// @param owner 该 tokenId 的当前所有者
    /// @param info 头寸的相关信息
    /// @param liquidity 头寸中减少的流动性数量，可能为 0
    /// @param feesAccrued 若流动性减少，头寸累积的手续费
    function notifyBurn(
        uint256 tokenId,
        address owner,
        uint256 info,
        uint256 liquidity,
        int256 feesAccrued
    ) external;

    /// @notice 当头寸修改其流动性或收取手续费时调用
    /// @param tokenId 头寸的 token ID
    /// @param liquidityChange 底层头寸的流动性变化量
    /// @param feesAccrued 因 modifyLiquidity 调用而将从头寸中收取的手续费
    /// @dev 注意：feesAccrued 可能被恶意用户人为抬高
    /// 只有单个流动性头寸的池子可以通过向自身捐赠（donate）来抬高 feeGrowthGlobal（进而抬高 feesAccrued）；
    /// 在同一个 unlockCallback 中原子地捐赠并收取手续费，可能会进一步抬高 feeGrowthGlobal/feesAccrued
    function notifyModifyLiquidity(
        uint256 tokenId,
        int256 liquidityChange,
        int256 feesAccrued
    ) external;
}
