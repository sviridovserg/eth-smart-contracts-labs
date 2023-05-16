// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract WalletMapContract {
    mapping (address => uint) balance;
    

    function deposit() public payable  {
        balance[msg.sender] += msg.value;
    }

    function getBalance() public view returns(uint) {
        return balance[msg.sender];
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdraw(address payable  to) public payable  {
        require(balance[msg.sender] - msg.value >= 0);
        balance[msg.sender] -= msg.value;
        to.transfer(msg.value);
    }

    function withdraw() public payable {
        withdraw(payable (msg.sender));
    }
}