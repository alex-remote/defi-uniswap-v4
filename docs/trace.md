# 英文注释翻译 · 任务进度跟踪

> 本文档由主代理维护，用于同步各子代理的翻译进度。文件未翻译时勾选框留空，子代理汇报完成且主代理复核通过后勾选。

## 一、任务说明

- 基准提交：`c4758a8`（`main`），工作分支：`defi-v4_zh`
- `.sol` / `.gitignore`：在英文注释原位置直接替换为中文，**翻译前后行数保持不变**，代码、字符串、`SPDX-License-Identifier` 均不改动
- `.md`：原件保持不变，在同一路径下新建 `<原文件名>_zh.md` 翻译件，与原件逐行对应、行数一致
- 保留专有名词与代码内的明确指代（函数名、变量名、合约名、NatSpec 标签及参数名、URL 等）

## 二、统计汇总

| 类型 | 文件数 | 总行数 | 说明 |
| --- | ---: | ---: | --- |
| Solidity `.sol` | 81 | 7255 | 原位翻译注释；其中 16 个文件仅含 SPDX 声明，无需改动但仍需复核 |
| Markdown `.md` | 18 | 938 | 新建 `_zh.md` 翻译件 |
| 其他（`.gitignore`） | 1 | 15 | 原位翻译 `#` 注释 |
| **合计** | **100** | **8208** | 待译注释行（`.sol`，含注释掉的代码，粗略统计）约 640 行 |

> 行数统计口径同 `wc -l`（换行符个数）。

## 三、子代理分工与进度

| 子代理 | 负责范围 | 文件数 | 总行数 | 状态 |
| --- | --- | ---: | ---: | --- |
| A01 | 根目录 README、foundry/README、notes 下的 .md | 5 | 210 | ✅ 已完成 |
| A02 | 练习文档 limit_order / counter / flash | 3 | 241 | ✅ 已完成 |
| A03 | 练习文档 swap_router / subscriber / liquidation | 3 | 238 | ✅ 已完成 |
| A04 | 其余 7 个练习文档 | 7 | 249 | ✅ 已完成 |
| A05 | 接口 IStateView / INotifier / ISubscriber | 3 | 261 | ✅ 已完成 |
| A06 | 其余接口（含 aave-v3） | 12 | 456 | ✅ 已完成 |
| A07 | libraries 全部 | 12 | 595 | ✅ 已完成 |
| A08 | types、Constants、TStore、examples、aave-v3、MixedRouteQuoterV2Example、.gitignore | 13 | 488 | ✅ 已完成 |
| A09 | LimitOrder（练习 + 答案） | 2 | 729 | ✅ 已完成 |
| A10 | Liquidate（练习 + 答案） | 2 | 311 | ✅ 已完成 |
| A11 | Posm（练习 + 答案） | 2 | 261 | ✅ 已完成 |
| A12 | Router（练习 + 答案） | 2 | 524 | ✅ 已完成 |
| A13 | SwapV3ToV4 / Reposition / Swap / Subscriber（练习 + 答案） | 8 | 712 | ✅ 已完成 |
| A14 | CounterHook / Flash / UniversalRouter / Reader（练习 + 答案） | 8 | 659 | ✅ 已完成 |
| A15 | 测试 PosmHelper / LimitOrder / Router / Tick | 4 | 1063 | ✅ 已完成 |
| A16 | 其余 14 个测试文件 | 14 | 1211 | ✅ 已完成 |
| A17 | 全仓库译法一致性校对（跨文件统一相同英文原句的译法、检查 `_zh.md` 链接） | — | — | ⏳ 进行中 |

## 四、文件清单

### `/（仓库根目录）`

- [x] `README.md` — 148 行 → `README_zh.md` · A01 · 译后 148 行 ✅

### `foundry`

- [x] `foundry/.gitignore` — 15 行 · `#` 注释 4 行 · A08 · 译后 15 行 ✅
- [x] `foundry/README.md` — 25 行 → `foundry/README_zh.md` · A01 · 译后 25 行 ✅

### `foundry/exercises`

- [x] `foundry/exercises/MixedRouteQuoterV2Example.sol` — 47 行 · 仅 SPDX 声明，无需改动 · A08 · 已复核，无需改动 ✅
- [x] `foundry/exercises/counter.md` — 63 行 → `foundry/exercises/counter_zh.md` · A02 · 译后 63 行 ✅
- [x] `foundry/exercises/flash.md` — 42 行 → `foundry/exercises/flash_zh.md` · A02 · 译后 42 行 ✅
- [x] `foundry/exercises/limit_order.md` — 136 行 → `foundry/exercises/limit_order_zh.md` · A02 · 译后 136 行 ✅
- [x] `foundry/exercises/liquidation.md` — 62 行 → `foundry/exercises/liquidation_zh.md` · A03 · 译后 62 行 ✅
- [x] `foundry/exercises/posm.md` — 55 行 → `foundry/exercises/posm_zh.md` · A04 · 译后 55 行 ✅
- [x] `foundry/exercises/quoter.md` — 38 行 → `foundry/exercises/quoter_zh.md` · A04 · 译后 38 行 ✅
- [x] `foundry/exercises/reader.md` — 29 行 → `foundry/exercises/reader_zh.md` · A04 · 译后 29 行 ✅
- [x] `foundry/exercises/reposition.md` — 23 行 → `foundry/exercises/reposition_zh.md` · A04 · 译后 23 行 ✅
- [x] `foundry/exercises/subscriber.md` — 71 行 → `foundry/exercises/subscriber_zh.md` · A03 · 译后 71 行 ✅
- [x] `foundry/exercises/swap.md` — 41 行 → `foundry/exercises/swap_zh.md` · A04 · 译后 41 行 ✅
- [x] `foundry/exercises/swap_router.md` — 105 行 → `foundry/exercises/swap_router_zh.md` · A03 · 译后 105 行 ✅
- [x] `foundry/exercises/swap_v3_v4.md` — 25 行 → `foundry/exercises/swap_v3_v4_zh.md` · A04 · 译后 25 行 ✅
- [x] `foundry/exercises/universal_router.md` — 38 行 → `foundry/exercises/universal_router_zh.md` · A04 · 译后 38 行 ✅

### `foundry/src`

- [x] `foundry/src/Constants.sol` — 42 行 · 待译注释约 3 行 · A08 · 译后 42 行 ✅
- [x] `foundry/src/TStore.sol` — 27 行 · 待译注释约 1 行 · A08 · 译后 27 行 ✅

### `foundry/src/aave-v3`

- [x] `foundry/src/aave-v3/Flash.sol` — 51 行 · 仅 SPDX 声明，无需改动 · A08 · 已复核，无需改动 ✅
- [x] `foundry/src/aave-v3/Liquidator.sol` — 39 行 · 仅 SPDX 声明，无需改动 · A08 · 已复核，无需改动 ✅

### `foundry/src/examples`

- [x] `foundry/src/examples/pool_id.sol` — 47 行 · 待译注释约 7 行 · A08 · 译后 47 行 ✅
- [x] `foundry/src/examples/transient_storage.sol` — 81 行 · 待译注释约 5 行 · A08 · 译后 81 行 ✅

### `foundry/src/exercises`

- [x] `foundry/src/exercises/CounterHook.sol` — 159 行 · 待译注释约 4 行 · A14 · 译后 159 行 ✅
- [x] `foundry/src/exercises/Flash.sol` — 42 行 · 待译注释约 4 行 · A14 · 译后 42 行 ✅
- [x] `foundry/src/exercises/LimitOrder.sol` — 247 行 · 待译注释约 16 行 · A09 · 译后 247 行 ✅
- [x] `foundry/src/exercises/Liquidate.sol` — 127 行 · 待译注释约 14 行 · A10 · 译后 127 行 ✅
- [x] `foundry/src/exercises/Posm.sol` — 96 行 · 待译注释约 13 行 · A11 · 译后 96 行 ✅
- [x] `foundry/src/exercises/Reader.sol` — 34 行 · 待译注释约 1 行 · A14 · 译后 34 行 ✅
- [x] `foundry/src/exercises/Reposition.sol` — 38 行 · 待译注释约 2 行 · A13 · 译后 38 行 ✅
- [x] `foundry/src/exercises/Router.sol` — 131 行 · 待译注释约 11 行 · A12 · 译后 131 行 ✅
- [x] `foundry/src/exercises/Subscriber.sol` — 87 行 · 待译注释约 8 行 · A13 · 译后 87 行 ✅
- [x] `foundry/src/exercises/Swap.sol` — 54 行 · 待译注释约 3 行 · A13 · 译后 54 行 ✅
- [x] `foundry/src/exercises/SwapV3ToV4.sol` — 74 行 · 待译注释约 5 行 · A13 · 译后 74 行 ✅
- [x] `foundry/src/exercises/UniversalRouter.sol` — 65 行 · 待译注释约 3 行 · A14 · 译后 65 行 ✅

### `foundry/src/interfaces`

- [x] `foundry/src/interfaces/IERC20.sol` — 18 行 · 仅 SPDX 声明，无需改动 · A06 · 已复核，无需改动 ✅
- [x] `foundry/src/interfaces/IExtsload.sol` — 27 行 · 待译注释约 11 行 · A06 · 译后 27 行 ✅
- [x] `foundry/src/interfaces/IExttload.sol` — 18 行 · 待译注释约 7 行 · A06 · 译后 18 行 ✅
- [x] `foundry/src/interfaces/INotifier.sol` — 59 行 · 待译注释约 29 行 · A05 · 译后 59 行 ✅
- [x] `foundry/src/interfaces/IPermit2.sol` — 64 行 · 待译注释约 19 行 · A06 · 译后 64 行 ✅
- [x] `foundry/src/interfaces/IPoolManager.sol` — 88 行 · 待译注释约 12 行 · A06 · 译后 88 行 ✅
- [x] `foundry/src/interfaces/IPositionManager.sol` — 47 行 · 待译注释约 4 行 · A06 · 译后 47 行 ✅
- [x] `foundry/src/interfaces/IStateView.sol` — 155 行 · 待译注释约 70 行 · A05 · 译后 155 行 ✅
- [x] `foundry/src/interfaces/ISubscriber.sol` — 47 行 · 待译注释约 24 行 · A05 · 译后 47 行 ✅
- [x] `foundry/src/interfaces/IUniversalRouter.sol` — 29 行 · 待译注释约 9 行 · A06 · 译后 29 行 ✅
- [x] `foundry/src/interfaces/IUnlockCallback.sol` — 12 行 · 待译注释约 4 行 · A06 · 译后 12 行 ✅
- [x] `foundry/src/interfaces/IV4Router.sol` — 59 行 · 待译注释约 8 行 · A06 · 译后 59 行 ✅
- [x] `foundry/src/interfaces/IWETH.sol` — 9 行 · 仅 SPDX 声明，无需改动 · A06 · 已复核，无需改动 ✅

### `foundry/src/interfaces/aave-v3`

- [x] `foundry/src/interfaces/aave-v3/IAaveOracle.sol` — 7 行 · 待译注释约 1 行 · A06 · 译后 7 行 ✅
- [x] `foundry/src/interfaces/aave-v3/IPool.sol` — 78 行 · 仅 SPDX 声明，无需改动 · A06 · 已复核，无需改动 ✅

### `foundry/src/libraries`

- [x] `foundry/src/libraries/ActionConstants.sol` — 21 行 · 待译注释约 9 行 · A07 · 译后 21 行 ✅
- [x] `foundry/src/libraries/Actions.sol` — 49 行 · 待译注释约 13 行 · A07 · 译后 49 行 ✅
- [x] `foundry/src/libraries/Commands.sol` — 45 行 · 待译注释约 13 行 · A07 · 译后 45 行 ✅
- [x] `foundry/src/libraries/CurrencyLib.sol` — 42 行 · 仅 SPDX 声明，无需改动 · A07 · 已复核，无需改动 ✅
- [x] `foundry/src/libraries/HookMiner.sol` — 70 行 · 待译注释约 19 行 · A07 · 译后 70 行 ✅
- [x] `foundry/src/libraries/Hooks.sol` — 90 行 · 仅 SPDX 声明，无需改动 · A07 · 已复核，无需改动 ✅
- [x] `foundry/src/libraries/Permit2Hash.sol` — 53 行 · 待译注释约 2 行 · A07 · 译后 53 行 ✅
- [x] `foundry/src/libraries/PositionInfoLibrary.sol` — 103 行 · 待译注释约 1 行 · A07 · 译后 103 行 ✅
- [x] `foundry/src/libraries/SafeCast.sol` — 18 行 · 仅 SPDX 声明，无需改动 · A07 · 已复核，无需改动 ✅
- [x] `foundry/src/libraries/SafeTransfer.sol` — 35 行 · 仅 SPDX 声明，无需改动 · A07 · 已复核，无需改动 ✅
- [x] `foundry/src/libraries/StateLibrary.sol` — 47 行 · 待译注释约 10 行 · A07 · 译后 47 行 ✅
- [x] `foundry/src/libraries/TransientState.sol` — 22 行 · 仅 SPDX 声明，无需改动 · A07 · 已复核，无需改动 ✅

### `foundry/src/solutions`

- [x] `foundry/src/solutions/CounterHook.sol` — 163 行 · 待译注释约 4 行 · A14 · 译后 163 行 ✅
- [x] `foundry/src/solutions/Flash.sol` — 61 行 · 待译注释约 5 行 · A14 · 译后 61 行 ✅
- [x] `foundry/src/solutions/LimitOrder.sol` — 482 行 · 待译注释约 15 行 · A09 · 译后 482 行 ✅
- [x] `foundry/src/solutions/Liquidate.sol` — 184 行 · 待译注释约 20 行 · A10 · 译后 184 行 ✅
- [x] `foundry/src/solutions/Posm.sol` — 165 行 · 待译注释约 26 行 · A11 · 译后 165 行 ✅
- [x] `foundry/src/solutions/Reader.sol` — 35 行 · 仅 SPDX 声明，无需改动 · A14 · 已复核，无需改动 ✅
- [x] `foundry/src/solutions/Reposition.sol` — 80 行 · 待译注释约 13 行 · A13 · 译后 80 行 ✅
- [x] `foundry/src/solutions/Router.sol` — 393 行 · 待译注释约 15 行 · A12 · 译后 393 行 ✅
- [x] `foundry/src/solutions/Subscriber.sol` — 109 行 · 待译注释约 6 行 · A13 · 译后 109 行 ✅
- [x] `foundry/src/solutions/Swap.sol` — 124 行 · 待译注释约 7 行 · A13 · 译后 124 行 ✅
- [x] `foundry/src/solutions/SwapV3ToV4.sol` — 146 行 · 待译注释约 19 行 · A13 · 译后 146 行 ✅
- [x] `foundry/src/solutions/UniversalRouter.sol` — 100 行 · 待译注释约 7 行 · A14 · 译后 100 行 ✅

### `foundry/src/types`

- [x] `foundry/src/types/BalanceDelta.sol` — 32 行 · 待译注释约 4 行 · A08 · 译后 32 行 ✅
- [x] `foundry/src/types/BeforeSwapDelta.sol` — 47 行 · 待译注释约 9 行 · A08 · 译后 47 行 ✅
- [x] `foundry/src/types/PoolId.sol` — 21 行 · 待译注释约 3 行 · A08 · 译后 21 行 ✅
- [x] `foundry/src/types/PoolKey.sol` — 16 行 · 待译注释约 6 行 · A08 · 译后 16 行 ✅
- [x] `foundry/src/types/PoolOperation.sol` — 23 行 · 待译注释约 8 行 · A08 · 译后 23 行 ✅

### `foundry/test`

- [x] `foundry/test/CounterHook.test.sol` — 197 行 · 待译注释约 6 行 · A16 · 译后 197 行 ✅
- [x] `foundry/test/FindHookSalt.test.sol` — 63 行 · 待译注释约 3 行 · A16 · 译后 63 行 ✅
- [x] `foundry/test/Flash.test.sol` — 44 行 · 仅 SPDX 声明，无需改动 · A16 · 已复核，无需改动 ✅
- [x] `foundry/test/LimitOrder.test.sol` — 385 行 · 待译注释约 25 行 · A15 · 译后 385 行 ✅
- [x] `foundry/test/Liquidate.test.sol` — 91 行 · 待译注释约 6 行 · A16 · 译后 91 行 ✅
- [x] `foundry/test/Posm.test.sol` — 168 行 · 待译注释约 6 行 · A16 · 译后 168 行 ✅
- [x] `foundry/test/PosmHelper.sol` — 207 行 · 待译注释约 27 行 · A15 · 译后 207 行 ✅
- [x] `foundry/test/Reader.test.sol` — 49 行 · 待译注释约 1 行 · A16 · 已复核，无需改动 ✅
- [x] `foundry/test/Reposition.test.sol` — 98 行 · 仅 SPDX 声明，无需改动 · A16 · 已复核，无需改动 ✅
- [x] `foundry/test/Router.test.sol` — 364 行 · 待译注释约 9 行 · A15 · 译后 364 行 ✅
- [x] `foundry/test/Subscriber.test.sol` — 77 行 · 仅 SPDX 声明，无需改动 · A16 · 已复核，无需改动 ✅
- [x] `foundry/test/Swap.test.sol` — 92 行 · 待译注释约 2 行 · A16 · 译后 92 行 ✅
- [x] `foundry/test/SwapV3ToV4.test.sol` — 111 行 · 待译注释约 4 行 · A16 · 译后 111 行 ✅
- [x] `foundry/test/TestHelper.sol` — 22 行 · 仅 SPDX 声明，无需改动 · A16 · 已复核，无需改动 ✅
- [x] `foundry/test/TestUtil.sol` — 26 行 · 待译注释约 2 行 · A16 · 译后 26 行 ✅
- [x] `foundry/test/Tick.test.sol` — 107 行 · 待译注释约 9 行 · A15 · 译后 107 行 ✅
- [x] `foundry/test/UniversalRouter.test.sol` — 88 行 · 待译注释约 2 行 · A16 · 译后 88 行 ✅
- [x] `foundry/test/UniversalRouterPermit2.test.sol` — 85 行 · 待译注释约 6 行 · A16 · 译后 85 行 ✅

### `notes`

- [x] `notes/course_intro.md` — 22 行 → `notes/course_intro_zh.md` · A01 · 译后 22 行 ✅
- [x] `notes/course_setup.md` — 7 行 → `notes/course_setup_zh.md` · A01 · 译后 7 行 ✅
- [x] `notes/v4.md` — 8 行 → `notes/v4_zh.md` · A01 · 译后 8 行 ✅

## 五、排除范围

- `foundry/lib/forge-std`：第三方 git 子模块（未检出），不属于教程内容
- `*.png`、`*.excalidraw`：图片与绘图数据，非源码注释
- `.gitignore`（根目录）、`.gitmodules`、`foundry/foundry.toml`、`foundry/.github/workflows/test.yml`、`foundry/.env.sample`：不含英文注释

## 六、复核方式

主代理对每个子代理汇报的文件逐一运行校验脚本，确认：

1. 行数与 `HEAD` 版本一致（`.md` 为翻译件与原件一致）
2. 去除注释后的代码逐行完全一致（`.md` 为代码围栏位置及代码块内非注释行一致）
3. 英文原件 `.md` 未被改动

## 七、原文疑似笔误（译文按本意处理，原文与代码均未改动）

| 位置 | 问题 | 译文处理 |
| --- | --- | --- |
| `foundry/src/{exercises,solutions}/CounterHook.sol` 第 7 行 | "ouputs" 应为 "outputs" | 按本意翻译 |
| `foundry/src/examples/pool_id.sol` 第 20 行 | `unwrap()` 的说明照抄了 `wrap()`，方向写反 | 按正确含义译为“把用户自定义值类型转换回值类型” |
| `foundry/src/interfaces/INotifier.sol` 第 50 行 | `unsubscriberGasLimit` 应为函数名 `unsubscribeGasLimit` | 标识符照抄原文 |
| `foundry/src/interfaces/INotifier.sol` 第 11 行 | "too low to avoid valid unsubscribe notifications" 语义不通 | 按本意译为“过低、不足以完成有效的取消订阅通知” |
| `foundry/src/interfaces/IStateView.sol` 第 53 行 | "fee growth outside a tick range"，但函数只接收单个 tick | 照原文直译 |
| `foundry/src/interfaces/IPermit2.sol` 第 18、34 行 | "alownce" 拼写错误；"prevent against signature replay protection" 语义重复 | 按本意译为“授权”“防止签名重放” |
| `foundry/src/interfaces/IV4Router.sol` 第 17、21 行 | 修饰 error 却写 "Emitted" | 译为“抛出” |
| `foundry/src/solutions/Posm.sol` 第 97–103 行 | `CLOSE_CURRENCY` 注释为单个代币，代码 `abi.encode(address(0), USDC)` 编码了两个地址（解码只读首字，运行结果不受影响） | 照原文翻译，代码未动 |
| `foundry/src/{exercises,solutions}/Subscriber.sol` | `posm` 声明为 `immutable` 且声明处已赋值，构造函数中再次赋值 | 不属翻译范围，未改动 |
| `foundry/test/Tick.test.sol` 第 64、71 行 | 写作 "tick 1 > tick 0"，测试数据实为 tick1 <= tick0 | 照原文直译 |
| `foundry/exercises/counter.md` 第 44、47 行 | 文字说 `afterSwap` 计数，示例代码却是 `counts[key.toId()]["beforeSwap"]` | 照原文翻译 |
| `foundry/exercises/limit_order.md` 第 88 行 | "approriate" 拼写错误 | 按本意翻译 |
| `foundry/exercises/quoter.md` 第 22 行 | "enivorment" 拼写错误 | 按本意译为“环境变量” |
| `foundry/exercises/swap_v3_v4.md` 第 18 行、`universal_router.md` 第 31 行 | 行内代码 `UniverswalRouter.execute` 拼写错误 | 行内代码保持原样 |
| `foundry/exercises/reader.md` 第 23 行 | "store in" 应为 "stored in" | 按本意翻译 |
| `foundry/exercises/liquidation.md` 第 16 行 | 称闪电贷期间 PoolManager "becomes locked"，实际回调期间为 unlocked，嵌套 `unlock` 会 revert | 照原文直译 |
| `notes/course_intro.md` 第 8 行 | "Auxillary" 应为 "Auxiliary" | 按本意译为“辅助合约” |
| `notes/course_setup.md` 第 5–7 行 | GitHub 绝对 URL 缺少 `/tree/main/` 或 `/blob/main/`，可能无法打开 | URL 保持原样 |

## 八、进度日志

- 2026-11-01：完成文件统计，创建本文档，分派 16 个子代理并行翻译
- 2026-11-01 15:01：A12 汇报完成，主代理复核 2/2 个文件通过；仅剩注释掉的 import 提示，可忽略
- 2026-11-01 15:01：A10 汇报完成，主代理复核 2/2 个文件通过；SWAP_EXACT_IN_SINGLE 常量名注释保留原文
- 2026-11-01 15:01：A16 汇报完成，主代理复核 14/14 个文件通过
- 2026-11-01 15:01：A14 汇报完成，主代理复核 8/8 个文件通过
- 2026-11-01 15:01：A09 汇报完成，主代理复核 2/2 个文件通过
- 2026-11-01 15:01：A11 汇报完成，主代理复核 2/2 个文件通过；amount0Max/amount1Max 参数名标注保留原文
- 2026-11-01 15:02：A02 汇报完成，主代理复核 3/3 个文件通过
- 2026-11-01 15:02：A05 汇报完成，主代理复核 3/3 个文件通过
- 2026-11-01 15:02：A15 汇报完成，主代理复核 4/4 个文件通过
- 2026-11-01 15:02：A08 汇报完成，主代理复核 13/13 个文件通过
- 2026-11-01 15:02：A13 汇报完成，主代理复核 8/8 个文件通过
- 2026-11-01 15:02：A03 汇报完成，主代理复核 3/3 个文件通过
- 2026-11-01 15:02：A04 汇报完成，主代理复核 7/7 个文件通过
- 2026-11-01 15:02：A01 汇报完成，主代理复核 5/5 个文件通过
- 2026-11-01 15:02：A06 汇报完成，主代理复核 12/12 个文件通过
- 2026-11-01 15:03：A07 汇报完成，主代理复核 12/12 个文件通过
- 2026-11-01：100/100 个文件全部复核通过；分派 A17 做跨文件译法一致性校对
