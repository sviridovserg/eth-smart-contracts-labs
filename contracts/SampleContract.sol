// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SampleContract {
    string public message = "Hello World";

    function updateMessage(string memory newMessage) public payable {
        if (msg.value >= 1000) {
            message = newMessage;
        } else {
            payable (msg.sender).transfer(msg.value);
        }
        
    }
}