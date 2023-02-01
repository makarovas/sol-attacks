pragma solidity ^0.8.0;

/* 

In this example, the Vulnerable contract is vulnerable to a reentrancy attack 
because it calls the Attacker contract's callMe function and passes address(this)
as an argument, which allows the Attacker contract to call back into the
Vulnerable contract and execute its fallback function again. 
This creates an infinite loop that drains the Vulnerable contract's balance.

*/

contract Attacker {
    function callMe(address payable _target) public {
        _target.call.value(1 ether)("");
    }
}

contract Vulnerable {
    uint public balance;

    function() public payable{
        balance +=msg.sender;
        Attacker attacker = new Attacker();
        attacker.callMe(address(this));
        
    }
}