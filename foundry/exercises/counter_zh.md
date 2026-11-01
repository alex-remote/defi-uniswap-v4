# Counter Hook 练习

在本练习中，你将学习如何编写一个自定义 hook 合约。

本练习的初始代码位于 [`foundry/src/exercises/CounterHook.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/exercises/CounterHook.sol)

参考答案位于 [`foundry/src/solutions/CounterHook.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/solutions/CounterHook.sol)

## 任务 1 - 配置 hook 权限

```solidity
function getHookPermissions()
    public
    pure
    returns (Hooks.Permissions memory)
{
    return Hooks.Permissions({
        beforeInitialize: false,
        afterInitialize: false,
        beforeAddLiquidity: false,
        afterAddLiquidity: false,
        beforeRemoveLiquidity: false,
        afterRemoveLiquidity: false,
        beforeSwap: false,
        afterSwap: false,
        beforeDonate: false,
        afterDonate: false,
        beforeSwapReturnDelta: false,
        afterSwapReturnDelta: false,
        afterAddLiquidityReturnDelta: false,
        afterRemoveLiquidityReturnDelta: false
    });
}
```

将 `beforeAddLiquidity`、`beforeRemoveLiquidity`、`beforeSwap` 和 `afterSwap` 设为 `true`。

## 任务 2 - 递增计数

对于上面的每个 hook 函数，递增状态变量 `counts`。

`counts` 是一个嵌套映射：从 `PoolId` 到函数名，再到该函数被调用的次数。

例如，`afterSwap` 的当前计数为

```solidity
counts[key.toId()]["beforeSwap"]
```

## 测试

1. 找出将 hook 合约部署到有效地址所需的 `salt` 值。

```shell
forge test --match-path test/FindHookSalt.test.sol -vvv
```

2. 将上一步执行命令后打印到终端的 salt 导出为环境变量。

```shell
export SALT=YOUR_SALT
forge test --fork-url $FORK_URL --match-path test/CounterHook.test.sol -vvv
```
