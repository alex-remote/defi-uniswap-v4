// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

// 复制自
// https://github.com/Uniswap/v4-core/blob/main/src/libraries/StateLibrary.sol

import {IPoolManager} from "../interfaces/IPoolManager.sol";
import {PoolId} from "../types/PoolId.sol";

library StateLibrary {
    bytes32 public constant POOLS_SLOT = bytes32(uint256(6));

    function getSlot0(address manager, PoolId poolId)
        internal
        view
        returns (
            uint160 sqrtPriceX96,
            int24 tick,
            uint24 protocolFee,
            uint24 lpFee
        )
    {
        // Pool.State 值所在存储槽的键：`pools[poolId]`
        bytes32 stateSlot = _getPoolStateSlot(poolId);

        bytes32 data = IPoolManager(manager).extsload(stateSlot);

        //   24 bits  |24bits|24bits      |24 bits|160 bits
        // 0x000000   |000bb8|000000      |ffff75 |0000000000000000fe3aa841ba359daa0ea9eff7
        // ---------- | fee  |protocolfee | tick  | sqrtPriceX96
        assembly ("memory-safe") {
            // data 的最低 160 位
            sqrtPriceX96 :=
                and(data, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
            // data 的接下来 24 位
            tick := signextend(2, shr(160, data))
            // data 的再接下来 24 位
            protocolFee := and(shr(184, data), 0xFFFFFF)
            // data 的最后 24 位
            lpFee := and(shr(208, data), 0xFFFFFF)
        }
    }

    function _getPoolStateSlot(PoolId poolId) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked(PoolId.unwrap(poolId), POOLS_SLOT));
    }
}
