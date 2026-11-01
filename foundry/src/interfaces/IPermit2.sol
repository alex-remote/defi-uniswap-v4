// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

interface IPermit2 {
    struct PermitDetails {
        // ERC20 代币地址
        address token;
        // 允许花费的最大数量
        uint160 amount;
        // spender 的代币授权额度失效的时间戳
        uint48 expiration;
        // 按 owner、token 和 spender 分别索引的递增值，每次签名递增一次
        uint48 nonce;
    }
    /// @notice 针对单个代币授权所签名的 permit 消息

    struct PermitSingle {
        // 单个代币授权的 permit 数据
        PermitDetails details;
        // 被授予已授权代币使用权限的地址
        address spender;
        // permit 签名的截止时间
        uint256 sigDeadline;
    }

    // IAllowanceTransfer
    function approve(
        address token,
        address spender,
        uint160 amount,
        uint48 expiration
    ) external;

    /// @notice 从代币所有者地址和调用者指定的字索引（word index）映射到一个位图。通过在位图中置位来防止签名重放
    /// @dev 使用无序 nonce，因此 permit 消息无需按特定顺序使用
    /// @dev 该映射先按代币所有者索引，再按 nonce 中指定的索引进行索引
    /// @dev 返回一个 uint256 位图
    /// @dev 索引（即 wordPosition）的上限为 type(uint248).max
    function nonceBitmap(address, uint256) external view returns (uint256);

    function permit(
        address owner,
        PermitSingle memory permitSingle,
        bytes calldata signature
    ) external;

    /// @dev 若 chainid 和合约地址与构造时相同，则使用缓存的值。
    function DOMAIN_SEPARATOR() external view returns (bytes32);

    error SignatureExpired(uint256 signatureDeadline);

    error InvalidNonce();
    /// @notice 当传入的签名长度无效时抛出
    error InvalidSignatureLength();

    /// @notice 当恢复出的签名者为零地址时抛出
    error InvalidSignature();

    /// @notice 当恢复出的签名者不等于 claimedSigner 时抛出
    error InvalidSigner();

    /// @notice 当恢复出的合约签名不正确时抛出
    error InvalidContractSignature();
}
