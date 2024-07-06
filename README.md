# ErrorHandlingExample
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract ErrorHandlingExample {
    address public owner;
    uint public value;

    constructor() {
        owner = msg.sender;
    }

```
owner: This is a public state variable of type address that stores the address of the contract deployer (the owner).
value: This is another public state variable of type uint (unsigned integer) used to store a numeric value that can be set and retrieved.
Constructor: The constructor function sets the owner variable to the address of the account that deploys the contract (msg.sender). This ensures that the initial deployer of the contract is marked as the owner.

```solidity

    function setValue(uint _value) public {
        // require statement for input validation
        require(_value > 0, "Value must be greater than zero");

        // assert statement for internal consistency checks
        assert(owner != address(0));

        // simulate a revert statement for unauthorized access
        if (msg.sender != owner) {
            revert("Unauthorized access");
        }

        // if all conditions are satisfied, set the value
        value = _value;
    }
```
require() Statement: This statement ensures that the _value passed to the setValue() function is greater than zero. If _value is not greater than zero, the function will revert and display the error message "Value must be greater than zero".

assert() Statement:This statement is used for internal consistency checks. Here, it asserts that the owner variable is not the zero address (address(0)). If owner is somehow set to the zero address, which should not happen under normal circumstances, the transaction will revert.

Conditional revert() Statement:This if statement checks if the msg.sender (the caller of the function) is not equal to owner. If this condition is true (indicating unauthorized access), the function will revert with the error message "Unauthorized access".
Setting value:

If all conditions (require(), assert(), and authorization check) pass successfully, the function proceeds to set the contract's value variable to the _value passed in.

```solidity
    function getValue() public view returns (uint) {
        return value;
    }
```
getValue() Function: This function is marked as view, meaning it does not modify the blockchain state. It simply returns the current value stored in the value variable.

