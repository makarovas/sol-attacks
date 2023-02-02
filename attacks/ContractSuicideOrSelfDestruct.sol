pragma solidity ^0.8.0;

/**
In this example, the selfDestruct function can only be called by the contract's owner, and it calls the selfdestruct built-in function, passing the owner address as the argument. This transfers all remaining funds in the contract to the owner address and destroys the contract.

 */
contract Vulnerable {
    address private owner;
    uint256 public balance;

    constructor() public {
        owner = msg.sender;
    }

    function deposit() public payable {
        balance += msg.value;
    }

    function withdraw(address _recipient, uint256 _amount) public {
         address payable recipient = address(uint160(_recipient));
        require(recipient.send(_amount), "Send failed");
        balance -= _amount;
    }

    function selfDestruct() public {
        require(msg.sender == owner, "Unauthorized access");
        selfdestruct(owner);
    }
}