# Router 练习

在本练习中，你将学习如何通过 [`PoolManager`](https://github.com/Uniswap/v4-core/blob/main/src/PoolManager.sol) 合约兑换代币。

本练习的初始代码位于 [`foundry/src/exercises/Router.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/exercises/Router.sol)

参考答案位于 [`foundry/src/solutions/Router.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/solutions/Router.sol)

## 任务 1 - 单跳兑换：精确输入

```solidity
function swapExactInputSingle(ExactInputSingleParams calldata params)
    external
    payable
    setAction(SWAP_EXACT_IN_SINGLE)
    returns (uint256 amountOut)
{
    // 在此编写你的代码
}
```

实现该函数，使其在 `PoolManager` 合约中针对单个池子执行兑换。

- 将 `ExactInputSingleParams.amountIn` 指定的全部输入代币，兑换为池子中另一种代币，且换得的数量尽可能多。

- 如果收到的输出数量少于 `ExactInputSingleParams.amountOutMin`，则 revert。

- 将所有未使用的代币退还给调用者。

- 返回输出代币的数量（`amountOut`）。

## 任务 2 - 单跳兑换：精确输出

```solidity
function swapExactOutputSingle(ExactOutputSingleParams calldata params)
    external
    payable
    setAction(SWAP_EXACT_OUT_SINGLE)
    returns (uint256 amountIn)
{
    // 在此编写你的代码
}
```

实现该函数，使其在 `PoolManager` 合约中针对单个池子执行兑换。

- 用尽可能少的输入代币，兑换出池子中另一种代币，输出数量精确等于 `ExactOutputSingleParams.amountOut` 指定的值。

- 如果输入数量大于 `ExactOutputSingleParams.amountInMax`，则 revert。

- 将所有未使用的代币退还给调用者。

- 返回输入代币的数量（`amountIn`）

## 任务 3 - 多跳兑换：精确输入

```solidity
function swapExactInput(ExactInputParams calldata params)
    external
    payable
    setAction(SWAP_EXACT_IN)
    returns (uint256 amountOut)
{
    // 在此编写你的代码
}
```

实现该函数，使其在 `PoolManager` 合约中跨多个池子执行兑换。

- 将 `ExactInputParams.amountIn` 指定的全部输入代币，兑换为尽可能多的最终代币，最终代币由 `ExactInputParams.path` 的最后一个元素指定。

- 如果收到的输出数量少于 `ExactInputParams.amountOutMin`，则 revert。

- 将所有未使用的代币退还给调用者。

- 返回输出代币的数量（`amountOut`）。

## 任务 4 - 多跳兑换：精确输出

```solidity
function swapExactOutput(ExactOutputParams calldata params)
    external
    payable
    setAction(SWAP_EXACT_OUT)
    returns (uint256 amountIn)
{
    // 在此编写你的代码
}
```

实现该函数，使其在 `PoolManager` 合约中跨多个池子执行兑换。

- 用尽可能少的输入代币，兑换出由 `ExactOutputParams.currencyOut` 指定的最终代币，输出数量精确等于 `ExactOutputParams.amountOut` 指定的值。

- 如果输入数量大于 `ExactOutputParams.amountInMax`，则 revert。

- 将所有未使用的代币退还给调用者。

- 返回输入代币的数量（`amountIn`）

## 测试

```shell
forge test --fork-url $FORK_URL --fork-block-number $FORK_BLOCK_NUM --match-path test/Router.test.sol -vvv
```
