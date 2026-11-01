// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

// import {console} from "forge-std/Test.sol";

import {IERC20} from "../interfaces/IERC20.sol";
import {IPoolManager} from "../interfaces/IPoolManager.sol";
import {IUnlockCallback} from "../interfaces/IUnlockCallback.sol";
import {CurrencyLib} from "../libraries/CurrencyLib.sol";

contract Flash is IUnlockCallback {
    using CurrencyLib for address;

    IPoolManager public immutable poolManager;
    // 用于测试闪电贷的合约地址
    address private immutable tester;

    modifier onlyPoolManager() {
        require(msg.sender == address(poolManager), "not pool manager");
        _;
    }

    constructor(address _poolManager, address _tester) {
        poolManager = IPoolManager(_poolManager);
        tester = _tester;
    }

    receive() external payable {}

    function unlockCallback(bytes calldata data)
        external
        onlyPoolManager
        returns (bytes memory)
    {
        // 在此编写你的代码
        return "";
    }

    function flash(address currency, uint256 amount) external {
        // 在此编写你的代码
    }
}
