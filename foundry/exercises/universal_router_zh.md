# Universal Router 练习

在本练习中，你将学习如何使用 [`UniversalRouter`](https://github.com/Uniswap/universal-router/blob/main/contracts/UniversalRouter.sol) 合约。

本练习的起始代码位于 [`foundry/src/exercises/UniversalRouter.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/exercises/UniversalRouter.sol)

参考答案位于 [`foundry/src/solutions/UniversalRouter.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/solutions/UniversalRouter.sol)

## 任务 1 - 兑换

```solidity
function swap(
    PoolKey calldata key,
    uint128 amountIn,
    uint128 amountOutMin,
    bool zeroForOne
) external payable {
    // 在此编写你的代码
}
```

调用 `UniversalRouter`，在 Uniswap V4 池子中兑换代币。

- 将要兑换的代币从 `msg.sender` 转入本合约。
- 为 `UniversalRouter` 授予 `Permit2` 授权。
- 准备调用 `UniversalRouter.execute` 所需的输入。
  - 要执行的命令是 `Commands.V4_SWAP`。
  - 该命令的输入编码了 `actions` 和 `params`。
    - `actions` 为 `Actions.SWAP_EXACT_IN_SINGLE`、`Actions.SETTLE_ALL` 和 `Actions.TAKE_ALL`。
    - `params` 是与每个 action 对应的输入。正确的输入请参阅 [`_handleAction`](https://github.com/Uniswap/v4-periphery/blob/60cd93803ac2b7fa65fd6cd351fd5fd4cc8c9db5/src/V4Router.sol#L32-L80)。
- 调用 `UniverswalRouter.execute`
- 将代币 0 和代币 1 都提取给 `msg.sender`。

## 测试

```shell
forge test --fork-url $FORK_URL --match-path test/UniversalRouter.test.sol -vvv
```
