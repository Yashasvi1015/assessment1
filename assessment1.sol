// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract ErrorHandlingExample {
    address public owner;
    uint public value;

    constructor() {
        owner = msg.sender;
    }

    function setValue(uint _value) public {
       
        require(_value > 0, "Value must be greater than zero");

        assert(owner != address(0));

        if (msg.sender != owner) {
            revert("Unauthorized access");
        }

        value = _value;
    }

    function getValue() public view returns (uint) {
        return value;
    }
}
