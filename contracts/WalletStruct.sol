// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract WalletStructContract {
    struct Transaction {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint total;
        uint numDeposits;
        mapping(uint => Transaction) deposits;
        uint numWithdrawals;
        mapping(uint =>  Transaction) withdrawals;
    }
    mapping (address => Balance) public balance;
    

    function deposit() public payable  {
        balance[msg.sender].total += msg.value;
        uint idx = balance[msg.sender].numDeposits;

        balance[msg.sender].deposits[idx].amount = msg.value;
        balance[msg.sender].deposits[idx].timestamp = block.timestamp;
        balance[msg.sender].numDeposits += 1;
        
    }

    // function getDeposits() public view returns(mapping(uint => bool) memory) {

    // }

    function getBalance() public view returns(uint) {
        return balance[msg.sender].total;
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdraw(address payable to, uint amount) public  {
        require(balance[msg.sender].total - amount >= 0);
        balance[msg.sender].total -=amount;
        uint idx = balance[msg.sender].numWithdrawals;
        balance[msg.sender].withdrawals[idx].amount = amount;
        balance[msg.sender].withdrawals[idx].timestamp = block.timestamp;
        balance[msg.sender].numWithdrawals += 1;
        to.transfer(amount);
    }

    function withdraw(uint amount) public {
        withdraw(payable (msg.sender), amount);
    }
}