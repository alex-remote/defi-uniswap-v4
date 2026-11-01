// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

interface IAaveOracle {
    // 返回 USD 价格（1 USD = 1e8）
    function getAssetPrice(address asset) external view returns (uint256);
}
