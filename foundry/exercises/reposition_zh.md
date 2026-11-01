# 头寸重新定位（Reposition）练习

在本练习中，你将编写一个简单的合约来重新定位（reposition）流动性。

本练习的起始代码位于 [`foundry/src/exercises/Reposition.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/exercises/Reposition.sol)

参考答案位于 [`foundry/src/solutions/Reposition.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/solutions/Reposition.sol)

## 任务 1 - 重新定位（reposition）

```solidity
function reposition(uint256 tokenId, int24 tickLower, int24 tickUpper)
    external
    returns (uint256 newTokenId) {}
```

该函数将 `tokenId` 的流动性重新定位到指定的 `tickLower` 和 `tickUpper` 边界。

## 测试

```shell
forge test --fork-url $FORK_URL --match-path test/Reposition.test.sol -vvv
```
