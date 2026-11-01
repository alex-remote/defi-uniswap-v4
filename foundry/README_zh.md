# 测试环境配置

```shell
# 在 .env 中填写环境变量
cp .env.sample .env

# 编译练习
forge build

# 编译参考答案
FOUNDRY_PROFILE=solution forge build

# 获取区块号
FORK_URL=...
FORK_BLOCK_NUM=$(cast block-number --rpc-url $FORK_URL)

# 测试练习
forge test --fork-url $FORK_URL --fork-block-number $FORK_BLOCK_NUM --match-path test/Router.test.sol -vvv

# 测试参考答案
FOUNDRY_PROFILE=solution forge test --fork-url $FORK_URL --fork-block-number $FORK_BLOCK_NUM --match-path test/Router.test.sol -vvv

# 如果遇到问题，可以尝试清理后从头重新编译
forge clean
```
