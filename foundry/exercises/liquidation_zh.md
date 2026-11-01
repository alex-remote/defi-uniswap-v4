# 清算练习

在本练习中，你将编写一个合约，它会：

1. 从 Aave V3 获取闪电贷。
2. 在 Aave V3 上清算一笔抵押不足的贷款。
3. 使用 [`UniversalRouter`](https://github.com/Uniswap/universal-router/blob/main/contracts/UniversalRouter.sol) 合约，将清算获得的抵押品兑换为当初被借出的那种代币。
4. 偿还闪电贷，并将利润发送给 `msg.sender`。

本练习的初始代码位于 [`foundry/src/exercises/Liquidate.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/exercises/Liquidate.sol)

参考答案位于 [`foundry/src/solutions/Liquidate.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/solutions/Liquidate.sol)

> **注意**  
> 本练习使用 **Aave V3** 的闪电贷，因为无法先从 **Uniswap V4** 获取闪电贷、再通过 `UniversalRouter` 在 Uniswap V4 上执行兑换。  
> 当你从 Uniswap V4 获取闪电贷时，`PoolManager` 合约会处于锁定状态，这会阻止 `UniversalRouter` 获取锁。  
> 实际上，更高效的做法是直接从 Uniswap V4 获取闪电贷（因为它的闪电贷手续费为 **0**），并直接通过 `PoolManager` 合约执行兑换。  
> 不过，本练习的重点是学习如何与 `UniversalRouter` 合约交互。

## 任务 1 - 发起清算

```solidity
function liquidate(
    // 要通过闪电贷借入的代币
    address tokenToRepay,
    // 要清算的用户
    address user,
    // 用于兑换抵押品的 V4 池子
    PoolKey calldata key
) external {}
```

该函数通过获取闪电贷来发起清算。

- 调用 `liquidator.getDebt`，获取偿还这笔抵押不足贷款所需的代币数量。
- 调用 `flash.flash` 获取闪电贷。`IFlash` 会回调 `flashCallback` 函数。
- 将多余的 `tokenToRepay` 退还给 `msg.sender`。

## 任务 2 - 清算、兑换并还款

```solidity
function flashCallback(
    address tokenToRepay,
    uint256 amount,
    uint256 fee,
    bytes calldata data
) external {
    // 在此编写你的代码
}
```

该函数执行清算，将获得的抵押品兑换为还款所需的代币，并偿还闪电贷。

- 调用 `liquidator.liquidate`，清算 `user` 抵押不足的贷款。
- 调用 `swap`，将抵押品兑换为偿还闪电贷所需的代币。
- 偿还闪电贷。

## 测试

```shell
forge test --fork-url $FORK_URL --match-path test/Liquidate.test.sol -vvv
```
