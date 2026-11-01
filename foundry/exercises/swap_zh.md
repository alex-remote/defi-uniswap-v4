# 兑换练习

在本练习中，你将学习如何通过 [`PoolManager`](https://github.com/Uniswap/v4-core/blob/main/src/PoolManager.sol) 合约兑换代币。

本练习的起始代码位于 [`foundry/src/exercises/Swap.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/exercises/Swap.sol)

参考答案位于 [`foundry/src/solutions/Swap.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/solutions/Swap.sol)

## 任务 1 - 发起兑换

```solidity
function swap(SwapExactInputSingleHop calldata params) external payable {
    // 在此编写你的代码
}
```

- 确定需要从调用者处收取的代币，并将其转入本合约。
- 解锁 `PoolManager` 合约。
- 将从调用者处收取但未用完的代币退还给调用者。

## 任务 2 - 解锁回调（unlock callback）

```solidity
function unlockCallback(bytes calldata data)
    external
    onlyPoolManager
    returns (bytes memory)
{
    // 在此编写你的代码
    return "";
}
```

- 通过 `PoolManager` 合约兑换代币。
- 若输出数量少于指定的最小值（`SwapExactInputSingleHop.amountOutMin`），则 revert

## 测试

```shell
forge test --fork-url $FORK_URL --match-path test/Swap.test.sol -vvv
```
