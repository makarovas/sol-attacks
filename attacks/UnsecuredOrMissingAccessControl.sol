pragma solidity ^0.8.0;

/* 

the withdraw() function allows any caller to withdraw an arbitrary amount
from the contract, as long as the contract has sufficient balance. 
This creates a vulnerability because anyone can call withdraw() 
and drain the entire balance of the contract.
To prevent this vulnerability, it is important to implement proper 
access control checks to ensure that only authorized users or contracts 
can perform certain actions. For example, you can add a check to ensure 
that only the owner of the contract or an authorized administrator can 
call the withdraw() function.

*/

contract Vurnerable {
    uint256 public balance;

    function deposit() public payable {
        balance += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(balance >= _amount, "Not enough funds");
        msg.sender.transfer(_amount);
        balance -= _amount;
    }
}


contract Vurnerable2 {
    address public owner;
    uint256 public balance;

    constructor() public {
        owner = msg.sender;
    }

    function deposit() public payable {
        balance += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(msg.sender == owner, 'Not authorized');
        require(balance >= _amount, "Not enough funds");
        msg.sender.transfer(_amount);
        balance -= _amount;
    }
}