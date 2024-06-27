// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract Example {
    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    function deposit(uint _amount) public payable {
        require(msg.value == _amount, "Incorrect amount sent");
        balance += msg.value;
    }

    function withdraw(uint _amount) public onlyOwner {
        require(_amount <= balance, "Insufficient balance");
        balance -= _amount;
        payable(owner).transfer(_amount);
    }

    function emergencyWithdraw(uint _amount) public onlyOwner {
        assert(balance >= _amount);
        if (balance < _amount) {
            revert("Insufficient balance for emergency withdraw");
        }
        balance -= _amount;
        payable(owner).transfer(_amount);
    }
}
