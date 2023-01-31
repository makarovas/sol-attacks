pragma solidity ^0.8.0;


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