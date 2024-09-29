// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Doubloon.sol";

contract MintableDoubloon is Doubloon {

    address public owner;
    constructor(uint256 _supply) Doubloon(_supply) {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    function mint(address _to, uint256 _amount) external onlyOwner{
        require(_to != address(0), "Invalid address");
        require(_amount > 0, "Amount must be greater than zero");

        totalSupply += _amount;
        balanceOf[_to] += _amount;

        emit Transfer(address(0), _to, _amount);
    }
}
