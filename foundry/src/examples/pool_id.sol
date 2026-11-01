// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {Test, console} from "forge-std/Test.sol";
import {PoolKey} from "../types/PoolKey.sol";
import {PoolId, PoolIdLibrary} from "../types/PoolId.sol";
import {
    POOL_ID_ETH_USDT,
    POOL_ID_ETH_USDC,
    POOL_ID_ETH_WBTC,
    USDT,
    USDC,
    WBTC
} from "../Constants.sol";

/*
- PoolId = keccak256(PoolKey)
- 用户自定义值类型（User defined value types）
  - wrap()：把值类型转换为用户自定义值类型
  - unwrap()：把用户自定义值类型转换回值类型

forge test --match-path src/examples/pool_id.sol -vvv
*/
contract Example_PoolId is Test {
    function test() public pure {
        PoolKey memory key = PoolKey({
            currency0: address(0),
            currency1: WBTC,
            fee: 3000,
            tickSpacing: 60,
            hooks: address(0)
        });

        PoolId id = PoolIdLibrary.toId(key);

        console.log("--- Pool id ---");

        // unwrap()：把 PoolId 转换为 bytes32
        bytes32 i = PoolId.unwrap(id);
        // wrap()：把 bytes32 转换为 PoolId
        PoolId p = PoolId.wrap(i);

        console.logBytes32(i);

        assertEq(POOL_ID_ETH_WBTC, PoolId.unwrap(id));
    }
}
