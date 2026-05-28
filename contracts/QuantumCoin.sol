// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract QuantumCoin {
    string public constant name = "QuantumCoin";
    string public constant symbol = "QTC";
    uint8 public constant decimals = 18;

    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(uint256 initialSupply) {
        uint256 supply = initialSupply * 10 ** uint256(decimals);
        totalSupply = supply;
        balanceOf[msg.sender] = supply;

        emit Transfer(address(0), msg.sender, supply);
    }

    function transfer(address to, uint256 value) external returns (bool) {
        require(to != address(0), "QuantumCoin: zero address");
        require(balanceOf[msg.sender] >= value, "QuantumCoin: insufficient balance");

        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;

        emit Transfer(msg.sender, to, value);
        return true;
    }
}
