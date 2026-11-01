# 限价单练习

在本练习中，你将学习如何编写一个限价单 hook 合约。

本练习的初始代码位于 [`foundry/src/exercises/LimitOrder.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/exercises/LimitOrder.sol)

参考答案位于 [`foundry/src/solutions/LimitOrder.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/solutions/LimitOrder.sol)

## 任务 1 - 初始化后的 hook（afterInitialize）

```solidity
function afterInitialize(
    address sender,
    PoolKey calldata key,
    uint160 sqrtPriceX96,
    int24 tick
) external onlyPoolManager returns (bytes4) {
    // 在此编写你的代码
    return this.afterInitialize.selector;
}
```

- 将池子的当前 tick 存入状态变量 `ticks`。

## 任务 2 - 下限价单

```solidity
function place(
    PoolKey calldata key,
    int24 tickLower,
    bool zeroForOne,
    uint128 liquidity
) external payable setAction(ADD_LIQUIDITY) {
    // 在此编写你的代码
}
```

该函数为 `msg.sender` 下一个限价单。

- 如果 `tickLower` 不是池子 tick 间距的整数倍，则 revert
- 调用 `poolManager.unlock`，并在 `unlockCallback` 中编写添加流动性的代码。
  - 流动性必须添加在 `tickLower` 与 `tickLower + tickSpacing` 之间。
  - 如果流动性将被添加到当前 tick 上，则 revert。
- 更新当前槽位（slot）中存储的 `Bucket`。
  - 调用 `getBucketId` 获取 `Bucket` 的 id。
  - 该桶（bucket）的当前槽位存储在 `slots[id]` 中。
  - 当前的 `Bucket` 存储在 `buckets[id][slots[id]]` 中。
- 触发 `Place` 事件

## 任务 3 - 取消限价单

```solidity
function cancel(PoolKey calldata key, int24 tickLower, bool zeroForOne)
    external
    setAction(REMOVE_LIQUIDITY)
{
    // 在此编写你的代码
}
```

该函数为 `msg.sender` 取消一个限价单。

- 如果要从中撤出限价单的 `Bucket` 已经 `filled`（已成交），则 revert。
- 从 `Bucket` 中移除 `msg.sender` 的流动性。
- 调用 `poolManager.unlock`，并在 `unlockCallback` 中编写移除流动性的代码。
  - 移除流动性时，返回该头寸累积的手续费。
  - 如果 `Bucket` 中的流动性大于 0，则将手续费分配给该 `Bucket`。
  - 如果 `Bucket` 中的流动性为 0，则将手续费交给 `msg.sender`。
- 触发 `Cancel` 事件

## 任务 4 - 提取兑换得到的代币

```solidity
function take(
    PoolKey calldata key,
    int24 tickLower,
    bool zeroForOne,
    uint256 slot
) external {
    // 在此编写你的代码
}
```

`msg.sender` 调用该函数，在其限价单被处理（成交）后提取兑换得到的代币。

- 如果 `Bucket` 尚未 `filled`，则 revert。
- 更新 `Bucket`
- 将相应数量的 `currency0` 和 `currency1` 发送给 `msg.sender`。
- 触发 `Take` 事件

## 任务 5 - 兑换后的 hook（afterSwap）

```solidity
function afterSwap(
    address sender,
    PoolKey calldata key,
    SwapParams calldata params,
    BalanceDelta delta,
    bytes calldata hookData
)
    external
    onlyPoolManager
    setAction(REMOVE_LIQUIDITY)
    returns (bytes4, int128)
{
    // 在此编写你的代码
    return (this.afterSwap.selector, 0);
}
```

该 hook 在兑换之后触发，负责从已处理（成交）的 `Bucket` 中移除流动性。

- 找出需要移除流动性的 tick 范围。
  - 该范围从上次存储的 tick（`ticks[key.toId()]`）到当前 `tick`，两者都先向下取整到 `tickSpacing` 的整数倍，再 `+/-` `tickSpacing`。
  - 提示：调用 `_getTickRange`
- 从上述 tick 范围中移除流动性。
  - 将 `Bucket.filled` 设为 `true`。
  - 将返回的 `currency0` 和 `currency1` 数量存入 `Bucket`。
  - 触发 `Fill` 事件。
  - 将该桶的槽位加 1。
- 将最新的 tick 存入 `ticks[key.toId()]`

## 测试

1. 找出将 hook 合约部署到有效地址所需的 `salt` 值。

```shell
forge test --match-path test/FindHookSalt.test.sol -vvv
```

2. 将上一步执行命令后打印到终端的 salt 导出为环境变量。

```shell
export SALT=YOUR_SALT
forge test --fork-url $FORK_URL --match-path test/LimitOrder.test.sol -vvv
```
