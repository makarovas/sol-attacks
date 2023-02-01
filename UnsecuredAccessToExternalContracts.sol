pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/ABIEncoderV2.sol"; // example url
/* 

the Vulnerable contract allows the caller to set the target address, 
which is then called using delegatecall in the callTarget() function. 
This creates a vulnerability because the code of the target contract
is executed in the context of the Vulnerable contract, allowing the target 
contract to access and modify the state of the Vulnerable contract.
For instance, if an attacker creates an instance of the Attacker contract 
and calls setEvilFunction(VulnerableInstance.address), then the next time
the Vulnerable contract calls callTarget(), the evilFunction() in the 
Attacker contract will be executed, causing the Vulnerable contract to 
self-destruct and transfer its balance to the attacker.
To prevent this vulnerability, it is important to thoroughly 
review and verify the code of external contracts before calling their functions, 
and to limit the access that external contracts have to the state of the calling 
contract. For example, you can use view functions or return data rather than 
modifying state.

*/

contract Attacker {
    function setEvilFuntion(address _target) public {
        _target.delegatecall(abi.encodeWithSignature('evilFunction()'));
    }
}


contract Vulnerable {
    address public target;
    uint256 public balance;

    function setTarget(address _target) public {
        target = _target;
    }

    function callTarget() public {
        target.delegatecall(abi.encodeWithSignature('someFunction()'));
    }

    function deposit() public payable {
        balance += msg.value;
    }

    function evilFuntion() public {
        selfdestruct(msg.sender);
    }
}