# 混合路由报价器（Mixed Route Quoter）练习

在本练习中，你将学习如何使用 [`MixedRouteQuoterV2`](https://github.com/Uniswap/mixed-quoter/blob/main/src/MixedRouteQuoterV2.sol) 合约。

## 任务 1 - `git clone`

用 git 克隆仓库 [`mixed-quoter`](https://github.com/Uniswap/mixed-quoter/tree/main)

```shell
git clone git@github.com:Uniswap/mixed-quoter.git
```

## 任务 2 - 安装依赖并编译仓库

在 `mixed-quoter` 仓库内执行

```shell
npm i
forge build
```

## 任务 3 - 注释掉环境变量

将 [`foundry.toml`](https://github.com/Uniswap/mixed-quoter/blob/d576527bff2e7c9db5434bb2b3806fd184610865/foundry.toml#L12-L53) 中 `rpc_endpoints` 和 `etherscan` 下的环境变量注释掉。

本练习不需要这些环境变量。

## 任务 4 - 复制 `MixedRouteQuoterV2Example.sol`

将 [`MixedRouteQuoterV2Example.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/exercises/MixedRouteQuoterV2Example.sol) 复制到 [`test`](https://github.com/Uniswap/mixed-quoter/tree/main/test) 文件夹中。

## 测试

在 `mixed-quoter` 仓库内执行测试命令。

```shell
forge test --fork-url $FORK_URL --match-path test/MixedRouteQuoterV2Example.sol -vvv
```
