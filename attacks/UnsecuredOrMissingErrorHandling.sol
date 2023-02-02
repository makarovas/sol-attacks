pragma solidity ^0.8.0;

/**
In this example, the withdraw() function transfers the requested amount to the caller without checking if the transfer was successful. If the transfer fails, for example because the caller's account is out of gas, the balance in the contract will still be decremented, leading to an incorrect balance.

To prevent this vulnerability, it is important to properly handle errors and revert the state of the contract in case of failure.



In this updated example, the withdraw() function uses the require() statement to check the success of the transfer. If the transfer fails, the require() statement will trigger a revert() operation, which rolls back the entire transaction and leaves the state of the contract unchanged. This helps to prevent incorrect balances and other unintended consequences.


 */
contract Vulnerable {
    uint256 public balance;

    function deposit() public payable {
        balance += msg.value;
    }

    function withdraw(uint256 _amount) public {
        address payable recipient = address(uint160(msg.sender));
        require(msg.sender.transfer(_amount), "Transfer failed");
        balance -= _amount;
    }
}
