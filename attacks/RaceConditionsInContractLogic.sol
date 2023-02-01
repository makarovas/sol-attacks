pragma solidity ^0.8.0;


/* 

In this example, the Vulnerable contract is vulnerable to a race condition 
because it does not properly synchronize access to the balance variable 
between the deposit() and withdraw() functions. 
For instance, if two transactions are executing 
the withdraw() function simultaneously, each will read 
the same balance value and believe there are enough funds to withdraw. 
However, only one of the transactions will succeed and both will decrease 
the balance by the same amount, leading to a situation where the balance becomes negative. 
To prevent race conditions, it is important to use proper synchronization mechanisms, 
such as mutex locks or atomic transactions.

*/
contract Vulnerable {
    uint256 public balance;

    function deposit() public payable {
        balance += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(balance >= _amount, 'Not enough funds');
        balance -= _amount;
        msg.sender.transfer(_amount);
    }
}