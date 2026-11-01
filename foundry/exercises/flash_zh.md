# 闪电贷练习

在本练习中，你将学习如何从 [`PoolManager`](https://github.com/Uniswap/v4-core/blob/main/src/PoolManager.sol) 合约执行闪电贷。

本练习的初始代码位于 [`foundry/src/exercises/Flash.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/exercises/Flash.sol)

参考答案位于 [`foundry/src/solutions/Flash.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/solutions/Flash.sol)

## 任务 1 - 发起闪电贷

```solidity
function flash(address currency, uint256 amount) external {
    // 在此编写你的代码
}
```

- 通过调用 `PoolManager.unlock` 解锁 `PoolManager` 合约
- 对输入参数（`currency` 和 `amount`）进行 ABI 编码，或将其保存到 storage 中。

## 任务 2 - 解锁回调

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

- 实现 `unlockCallback`
- 按调用 `flash` 函数时指定的 `amount`，借出 `currency` 的闪电贷。
- 从 `PoolManager` 合约借入 `currency` 后，立即调用 `tester.call("")`。
  该外部调用会检查闪电贷是否已被正确借出。

## 测试

```shell
forge test --fork-url $FORK_URL --match-path test/Flash.test.sol -vvv
```
