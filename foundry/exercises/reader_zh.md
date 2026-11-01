# Reader 练习

在本练习中，你将学习如何从 [`PoolManager`](https://github.com/Uniswap/v4-core/blob/main/src/PoolManager.sol) 合约读取瞬态存储（transient storage）。

本练习的起始代码位于 [`foundry/src/exercises/Reader.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/exercises/Reader.sol)

参考答案位于 [`foundry/src/solutions/Reader.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/solutions/Reader.sol)

## 任务 1 - 获取代币 delta

```solidity
function getCurrencyDelta(address target, address currency)
    public
    view
    returns (int256 delta)
{
    // 在此编写你的代码
}
```

获取由 `target` 和 `currency` 标识的代币 delta。

测试会从 `PoolManager` 合约中提取代币，然后将 `PoolManager` 中存储的代币 delta 与你的代码返回的值进行比对。

## 测试

```shell
forge test --fork-url $FORK_URL --match-path test/Reader.test.sol -vvv
```
