// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SampleContract {
    string public message = "Hello World";

    mapping (uint => bool) public map;
    mapping (address =>  bool) public myAddr;

    function getMapVal(uint ind) public view returns(bool) {
        return map[ind];
    }

    function setVal(uint index) public {
        map[index] = true;
    }

    function setAddr() public  {
        myAddr[msg.sender] = true;
    }
}