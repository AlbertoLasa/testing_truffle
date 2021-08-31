// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Money {
    address public owner;
    uint256 public timestamp;
    uint256 public supply;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
        timestamp = block.timestamp;
        supply = 1000;
        balances[msg.sender] = 1000;
    }

    function transfer(uint256 amount, address to) public returns (bool) {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        balances[to] += amount;

        return true;
    }

    function addSupply() public returns (bool) {
        require(block.timestamp - timestamp > 7 days, "Error time");

        timestamp = block.timestamp;
        supply += 1000;
        balances[msg.sender] += 1000;

        return true;
    }

    function add(uint256 x, uint256 y) public view returns (uint256) {
        require(msg.sender == owner, "Without permission");

        return x + y;
    }
}
