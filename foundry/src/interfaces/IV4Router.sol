// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {PoolKey} from "../types/PoolKey.sol";

struct PathKey {
    address intermediateCurrency;
    uint24 fee;
    int24 tickSpacing;
    address hooks;
    bytes hookData;
}

/// @title IV4Router
/// @notice V4Router 合约的接口
interface IV4Router {
    /// @notice 当 exactInput 兑换收到的数量未达到 minAmountOut 时抛出
    error V4TooLittleReceived(
        uint256 minAmountOutReceived, uint256 amountReceived
    );
    /// @notice 当 exactOutput 被要求支付的数量超过 maxAmountIn 时抛出
    error V4TooMuchRequested(
        uint256 maxAmountInRequested, uint256 amountRequested
    );

    /// @notice 单跳精确输入兑换的参数
    struct ExactInputSingleParams {
        PoolKey poolKey;
        bool zeroForOne;
        uint128 amountIn;
        uint128 amountOutMinimum;
        bytes hookData;
    }

    /// @notice 多跳精确输入兑换的参数
    struct ExactInputParams {
        address currencyIn;
        PathKey[] path;
        uint128 amountIn;
        uint128 amountOutMinimum;
    }

    /// @notice 单跳精确输出兑换的参数
    struct ExactOutputSingleParams {
        PoolKey poolKey;
        bool zeroForOne;
        uint128 amountOut;
        uint128 amountInMaximum;
        bytes hookData;
    }

    /// @notice 多跳精确输出兑换的参数
    struct ExactOutputParams {
        address currencyOut;
        PathKey[] path;
        uint128 amountOut;
        uint128 amountInMaximum;
    }
}
