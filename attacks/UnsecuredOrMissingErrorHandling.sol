pragma solidity ^0.8.0;

contract Vulnerable {
    uint256 public balance;

    function deposit() public payable {
        balance += msg.value;

    }

    function withdraw(uint256 _amount) public {
        address payable recipient = address(uint160(msg.sender));
        require(msg.sender.transfer(_amount), 'Transfer failed');
        balance -= _amount;

    }
}