# 订阅者（Subscriber）练习

在本练习中，你将学习如何为 [`PositionManager`](https://github.com/Uniswap/v4-periphery/blob/main/src/PositionManager.sol) 合约编写一个订阅者合约。

本练习的初始代码位于 [`foundry/src/exercises/Subscriber.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/exercises/Subscriber.sol)

参考答案位于 [`foundry/src/solutions/Subscriber.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/solutions/Subscriber.sol)

`Subscriber` 合约会根据用户添加或移除的流动性数量，铸造或销毁相应数量的不可转让代币。

## 任务 1 - 订阅通知

```solidity
function notifySubscribe(uint256 tokenId, bytes memory data)
    external
    onlyPositionManager
{
    // 在此编写你的代码
}
```

- 向 `tokenId` 的所有者铸造与 `tokenId` 中锁定的流动性数量相等的代币。
- 将 `tokenId` 的 `PoolId` 和所有者分别存入状态变量 `poolIds` 和 `ownerOf`。这些数据稍后会被 `notifyUnsubscribe` 和 `notifyBurn` 使用。

## 任务 2 - 取消订阅通知

```solidity
function notifyUnsubscribe(uint256 tokenId) external onlyPositionManager {
    // 在此编写你的代码
}
```

- 销毁 `tokenId` 对应的全部不可转让代币
- 删除 `poolIds` 和 `ownerOf` 中 `tokenId` 对应的数据。

## 任务 3 - 销毁通知

```solidity
function notifyBurn(
    uint256 tokenId,
    address owner,
    uint256 info,
    uint256 liquidity,
    int256 feesAccrued
) external onlyPositionManager {
    // 在此编写你的代码
}
```

- 销毁 `tokenId` 对应的全部不可转让代币
- 删除 `poolIds` 和 `ownerOf` 中 `tokenId` 对应的数据。

## 任务 4 - 修改流动性通知

```solidity
function notifyModifyLiquidity(
    uint256 tokenId,
    int256 liquidityChange,
    int256 feesAccrued
) external onlyPositionManager {
    // 在此编写你的代码
}
```

- 如果 `liquidityChange` 为正，则额外铸造不可转让代币，否则销毁相应数量的代币。

## 测试

```shell
forge test --fork-url $FORK_URL --match-path test/Subscriber.test.sol -vvv
```
