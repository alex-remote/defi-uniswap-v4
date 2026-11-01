# Position Manager 练习

在本练习中，你将学习如何使用 [`PositionManager`](https://github.com/Uniswap/v4-periphery/blob/main/src/PositionManager.sol) 合约。

本练习的起始代码位于 [`foundry/src/exercises/Posm.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/exercises/Posm.sol)

参考答案位于 [`foundry/src/solutions/Posm.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/src/solutions/Posm.sol)

## 任务 1 - 增加流动性

```solidity
function increaseLiquidity(
    uint256 tokenId,
    uint256 liquidity,
    uint128 amount0Max,
    uint128 amount1Max
) external payable {
    // 在此编写你的代码
}
```

完成该函数，为 `tokenId` 所标识的头寸增加流动性。

## 任务 2 - 减少流动性

```solidity
function decreaseLiquidity(
    uint256 tokenId,
    uint256 liquidity,
    uint128 amount0Min,
    uint128 amount1Min
) external {
    // 在此编写你的代码
}
```

完成该函数，为 `tokenId` 所标识的头寸减少流动性。

## 任务 3 - 销毁（burn）

```solidity
function burn(uint256 tokenId, uint128 amount0Min, uint128 amount1Min)
    external
{
    // 在此编写你的代码
}
```

完成该函数，销毁 `tokenId` 所标识的头寸。

## 测试

```shell
forge test --fork-url $FORK_URL --match-path test/Posm.test.sol -vvv
```
