# V3 到 V4 兑换练习

在本练习中，你将学习如何使用 [`UniversalRouter`](https://github.com/Uniswap/universal-router/blob/main/contracts/UniversalRouter.sol) 合约执行一次从 V3 到 V4 的多跳兑换。

本练习的起始代码位于 [`foundry/src/exercises/SwapV3ToV4.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/exercises/SwapV3ToV4.sol)

参考答案位于 [`foundry/src/solutions/SwapV3ToV4.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/solutions/SwapV3ToV4.sol)

## 任务 1 - 兑换

```solidity
function swap(V3Params calldata v3, V4Params calldata v4) external {}
```

调用 `UniversalRouter`，先在 Uniswap V3 池子中将代币 `A` 兑换为 `B`，再在 V4 池子中将 `B` 兑换为 `C`。

- 将 `v3.tokenIn` 从 `msg.sender` 转给 `UniversalRouter` 合约。
- 调用 `UniverswalRouter.execute`，依次传入命令 `V3_SWAP_EXACT_IN`、`UNWRAP_WETH`（当 `v3.tokenOut` 为 `WETH` 时）和 `V4_SWAP`。
- 将兑换得到的代币提取给 `msg.sender`。

## 测试

```shell
forge test --fork-url $FORK_URL --match-path test/SwapV3ToV4.test.sol -vvv
```
