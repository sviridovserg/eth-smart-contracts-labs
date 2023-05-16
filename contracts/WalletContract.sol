// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract WalletContract {
    uint balance;

    function deposit() public payable  {
        balance += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdraw(address payable  to) public  {
        
        to.transfer(getBalance());
    }

    function withdraw() public {
        payable (msg.sender).transfer(getBalance());
    }
}