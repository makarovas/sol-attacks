pragma solidity ^0.8.0;
/* 

In this example, the Vulnerable contract is vulnerable to an unchecked send() call 
because it calls address(0).send(msg.value) without checking the return value. 
This can result in the loss of funds because the send() function will throw an exception, 
but the ether will still be sent to the address 0x0. To prevent this, it is important to 
always check the return value of send() and ensure that it is equal to true before proceeding.
*/
contract Attacker {
    function attack(address  payable _target) public {
        _target.send(1 ether);
    }
}

contract Vulnerable {
    function sendEth() public payable  {
        require(msg.value >=1 ether, 'Not enough');
        address(0).send(msg.value); //this will throw an exception but the ether will be sent
    }
}