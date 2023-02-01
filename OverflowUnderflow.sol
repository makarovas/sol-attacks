pragma solidity ^0.8.0;


/*
Vulnerable contract is vulnerable to overflows and underflows because it performs arithmetic operations on 
totalSupply without checking for overflow/underflow conditions. 
For instance, if totalSupply is equal to 2**256 - 1 and _value is equal to 1, 
then totalSupply + _value will result in an overflow, wrapping around to 0. 
Similarly, if totalSupply is equal to 0 and _value is equal to 1, 
then totalSupply - _value will result in an underflow, wrapping around to 2**256 - 1.
To prevent overflows and underflows, it is important to use safe arithmetic
functions, such as those provided by the SafeMath library.
 */

 
contract Vulnerable {
    uint256 public totalSupply = 2**256 -1;

    function add(uint256 _value) public {
        totalSupply += _value
    }

    function subtract(uint256 _value) public {
        totalSupply -= _value;
    }
}