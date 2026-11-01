# defi-uniswap-v4

<div align="center">
<img src=".github/images/uni.png" width="145" alt=""/>
<p align="center">
    <a href="https://cyfrin.io/">
        <img src=".github/images/poweredbycyfrinbluehigher.png" width="145" alt=""/></a>
            <a href="https://updraft.cyfrin.io/courses/defi-uniswap-v4">
        <img src=".github/images/coursebadge.png" width="242.3" alt=""/></a>
    <br />
</p>
</div>

本仓库存放本课程的课程资源和[讨论区](https://github.com/Cyfrin/defi-uniswap-v4/discussions)。

如需深入了解课程内容，请参考以下资源：

- [官网](https://updraft.cyfrin.io) - 加入 Cyfrin Updraft，畅享 50 多个小时的智能合约开发课程
- [Twitter](https://twitter.com/CyfrinUpdraft) - 及时获取最新的课程发布动态
- [LinkedIn](https://www.linkedin.com/school/cyfrin-updraft/) - 将 Updraft 添加到你的学习经历中
- [Discord](https://discord.gg/cyfrin) - 加入由 3000 多名开发者和审计员组成的社区
- [Codehawks](https://codehawks.com) - 智能合约审计竞赛，助力守护 web3 安全

# 课程介绍

- [课程介绍](./notes/course_intro_zh.md)
- [环境搭建](./notes/course_setup_zh.md)

# 概览

- [V4 与 V3 对比](./notes/v4_zh.md)
- [代码仓库](./notes/repos.png)

# Pool manager（池子管理器）

- [Currency](https://github.com/Uniswap/v4-core/blob/main/src/types/Currency.sol)
- 池子键（pool key）与池子 ID（pool id）
  - [PoolKey](https://github.com/Uniswap/v4-core/blob/main/src/types/PoolKey.sol)
  - [PoolId](https://github.com/Uniswap/v4-core/blob/main/src/types/PoolId.sol)
  - [示例](./foundry/src/examples/pool_id.sol)
  - [Dune - 如何根据 PoolId 获取 PoolKey](https://dune.com/queries/5671549?category=decoded_project&namespace=uniswap_v4&blockchain=ethereum&contract=PoolManager&blockchains=ethereum&id=uniswap_v4_ethereum.poolmanager_evt_initialize)
- Lock（锁）
  - [`Lock`](https://github.com/Uniswap/v4-core/blob/main/src/libraries/Lock.sol)
  - [`unlock`](https://github.com/Uniswap/v4-core/blob/59d3ecf53afa9264a16bba0e38f4c5d2231f80bc/src/PoolManager.sol#L104-L114)
  - [`NonzeroDeltaCount`](https://github.com/Uniswap/v4-core/blob/main/src/libraries/NonzeroDeltaCount.sol)
- [瞬态存储（transient storage）](./foundry/src/examples/transient_storage.sol)
  - [`NonzeroDeltaCount`](https://github.com/Uniswap/v4-core/blob/main/src/libraries/NonzeroDeltaCount.sol)
  - [`_accountDelta`](https://github.com/Uniswap/v4-core/blob/59d3ecf53afa9264a16bba0e38f4c5d2231f80bc/src/PoolManager.sol#L368-L378)
  - [账户 delta（account delta）](./notes/account_delta.png)
- [代币储备（currency reserves）](https://github.com/Uniswap/v4-core/blob/59d3ecf53afa9264a16bba0e38f4c5d2231f80bc/src/PoolManager.sol#L279-L288)
- [兑换的合约调用流程](./notes/swap.png)
  - [`BalanceDelta`](https://github.com/Uniswap/v4-core/blob/main/src/types/BalanceDelta.sol)
  - [练习 - 闪电贷](./foundry/exercises/flash_zh.md)
  - [练习 - 兑换](./foundry/exercises/swap_zh.md)
- 读取数据
  - [`extsload`](https://github.com/Uniswap/v4-core/blob/main/src/Extsload.sol)
  - [`exttload`](https://github.com/Uniswap/v4-core/blob/main/src/Exttload.sol)
  - [`StateLibrary`](https://github.com/Uniswap/v4-core/blob/main/src/libraries/StateLibrary.sol)
    - [`StateView`](https://github.com/Uniswap/v4-periphery/blob/main/src/lens/StateView.sol)
  - [`TransientStateLibrary`](https://github.com/Uniswap/v4-core/blob/main/src/libraries/TransientStateLibrary.sol)
    - [`DeltaResolver`](https://github.com/Uniswap/v4-periphery/blob/main/src/base/DeltaResolver.sol)
  - [练习 - 获取代币 delta](./foundry/exercises/reader_zh.md)
- [应用 - 兑换路由](./foundry/exercises/swap_router_zh.md)

# Hooks（钩子）

- 核心概念
  - 在兑换、修改流动性等池子操作之前和之后调用外部合约
    - [`PoolManager`](https://github.com/Uniswap/v4-core/blob/main/src/PoolManager.sol)
    - [`IHooks`](https://github.com/Uniswap/v4-core/blob/main/src/interfaces/IHooks.sol)
    - [`Hooks`](https://github.com/Uniswap/v4-core/blob/main/src/libraries/Hooks.sol)
  - [hooks 是推导 `PoolId` 的组成部分](./notes/hooks.png)
- hook 标志位是如何编码进 hooks 地址的？
  - 最低 14 位
    - [标志位（Flags）](https://github.com/Uniswap/v4-core/blob/59d3ecf53afa9264a16bba0e38f4c5d2231f80bc/src/libraries/Hooks.sol#L27-L47)
    - [`hasPermission`](https://github.com/Uniswap/v4-core/blob/59d3ecf53afa9264a16bba0e38f4c5d2231f80bc/src/libraries/Hooks.sol#L337-L339)
  - [`HookMiner`](https://github.com/Uniswap/v4-periphery/blob/main/src/utils/HookMiner.sol)
    - [`FindHookSalt.sol`](https://github.com/Cyfrin/defi-uniswap-v4/blob/main/foundry/test/FindHookSalt.test.sol)
- [在 hooks 合约内获取 msg.sender](./notes/hooks_msg_sender.png)
- [练习 - 计数器 hook](./foundry/exercises/counter_zh.md)
- [应用 - 限价单](./foundry/exercises/limit_order_zh.md)
  - [什么是限价单](https://app.uniswap.org/limit)
  - [复习 tick 与流动性](https://www.desmos.com/calculator/x31s77joxw)
  - [算法](./notes/limit_order.png)

# Position Manager（头寸管理器）

- 核心概念
  - [`PositionManager`](https://github.com/Uniswap/v4-periphery/blob/main/src/PositionManager.sol)
  - 入口
    - [`modifyLiquidities`](https://github.com/Uniswap/v4-periphery/blob/60cd93803ac2b7fa65fd6cd351fd5fd4cc8c9db5/src/PositionManager.sol#L172-L179)
    - [`BaseActionsRouter`](https://github.com/Uniswap/v4-periphery/blob/main/src/base/BaseActionsRouter.sol)
    - [`Actions`](https://github.com/Uniswap/v4-periphery/blob/main/src/libraries/Actions.sol)
  - 铸造、销毁、增加 / 减少流动性以及收取手续费
    - [`V4Resolver`](https://github.com/Uniswap/v4-periphery/blob/main/src/base/DeltaResolver.sol)
  - [`permit2`](./notes/permit2.png)
    - [`permit2`](https://github.com/Uniswap/permit2)
    - [`Permit2Forwarder.sol`](https://github.com/Uniswap/v4-periphery/blob/main/src/base/Permit2Forwarder.sol)
    - [`Multicall_v4`](https://github.com/Uniswap/v4-periphery/blob/main/src/base/Multicall_v4.sol)
- [练习 - 头寸管理器（position manager）](./foundry/exercises/posm_zh.md)
  - [订阅者](./notes/subscribe.png)
    - [`Notifier`](https://github.com/Uniswap/v4-periphery/blob/main/src/base/Notifier.sol)
- [练习 - 订阅者](./foundry/exercises/subscriber_zh.md)
- [应用 - 调整流动性头寸（reposition）](./foundry/exercises/reposition_zh.md)

# Universal Router

- [`UniversalRouter`](https://docs.uniswap.org/contracts/universal-router/overview)
- 工作原理
  - [`execute`](https://github.com/Uniswap/universal-router/blob/3663f6db6e2fe121753cd2d899699c2dc75dca86/contracts/UniversalRouter.sol#L44-L62)
  - [`dispatch`](https://github.com/Uniswap/universal-router/blob/3663f6db6e2fe121753cd2d899699c2dc75dca86/contracts/base/Dispatcher.sol#L47-L286)
  - [`Commands`](https://github.com/Uniswap/universal-router/blob/main/contracts/libraries/Commands.sol)
    - [示例 - `Permit2` 与不回滚（non-reverting）的命令](./foundry/test/UniversalRouterPermit2.test.sol)
  - [命令与输入参数](https://docs.uniswap.org/contracts/universal-router/technical-reference)
  - [`V4SwapRouter`](https://github.com/Uniswap/universal-router/blob/main/contracts/modules/uniswap/v4/V4SwapRouter.sol)
  - [`IV4Router`](https://github.com/Uniswap/v4-periphery/blob/main/src/interfaces/IV4Router.sol)
- UniversalRouter 与 Permit2
  - [`V4SwapRouter`](https://github.com/Uniswap/universal-router/blob/main/contracts/modules/uniswap/v4/V4SwapRouter.sol)
  - [`DeltaResolver`](https://github.com/Uniswap/v4-periphery/blob/main/src/base/DeltaResolver.sol)
  - [`payOrPermit2Transfer`](https://github.com/Uniswap/universal-router/blob/3663f6db6e2fe121753cd2d899699c2dc75dca86/contracts/modules/Permit2Payments.sol#L42-L45)
- [练习 - 执行 UniversalRouter 命令](./foundry/exercises/universal_router_zh.md)
- [从 V3 到 V4 的多跳兑换](./notes/uni_router_v3_v4_swap.png)
- [练习 - 先在 V3 再在 V4 上进行多跳兑换](./foundry/exercises/swap_v3_v4_zh.md)
- [练习 - 报价器（Quoter）](./foundry/exercises/quoter_zh.md)
- [应用 - 清算](./foundry/exercises/liquidation_zh.md)

# 资源

- [Uniswap V4](https://v4.uniswap.org/)
- [Uniswap V4 池子](https://app.uniswap.org/explore/pools)
- [Uniswap V4 文档](https://docs.uniswap.org/contracts/v4/overview)
- [GitHub - v4-core](https://github.com/Uniswap/v4-core)
- [GitHub - v4-periphery](https://github.com/Uniswap/v4-periphery)
- [GitHub - universal-router](https://github.com/Uniswap/universal-router)
- [GitHub - v4-template](https://github.com/uniswapfoundation/v4-template)
- [GitHub - permit2](https://github.com/Uniswap/permit2)
- [GitHub - mixed-quoter](https://github.com/Uniswap/mixed-quoter)
- [YouTube - Unichain 上的 Uniswap v4](https://www.youtube.com/watch?v=ZisqLqbakfM)
- [Cyfrin - Uniswap V4 兑换：深入剖析执行与记账](https://www.cyfrin.io/blog/uniswap-v4-swap-deep-dive-into-execution-and-accounting)
- [PoolManager - 存储布局](https://www.evm.codes/contract?address=0x000000000004444c5dc75cb358380d2e3de08a90)
- [Dune - 如何根据 PoolId 获取 PoolKey](https://dune.com/queries/5671549?category=decoded_project&namespace=uniswap_v4&blockchain=ethereum&contract=PoolManager&blockchains=ethereum&id=uniswap_v4_ethereum.poolmanager_evt_initialize)
- [Uniswap v4 by Example（通过示例学习 Uniswap v4）](https://www.v4-by-example.org/)
- [Bunni](https://bunni.xyz/)
- [Damian Rusinek - Uniswap V4 的秘密：深入探讨 Hooks 安全](https://www.youtube.com/watch?v=VhEbnGSUdYY)
- [`BaseHook`](https://github.com/Uniswap/v4-periphery/blob/main/src/utils/BaseHook.sol)
- [`LimitOrder`](https://github.com/Uniswap/v4-periphery/blob/example-contracts/contracts/hooks/examples/LimitOrder.sol)
- [Permit2](https://github.com/dragonfly-xyz/useful-solidity-patterns/tree/main/patterns/permit2)
- [如何使用 `UniversalRouter` 从 V3 兑换到 V4](https://x.com/saucepoint/status/1950588162578817460)
