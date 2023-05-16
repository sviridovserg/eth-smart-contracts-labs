// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SampleFallback {
    uint public lastValSent;
    string public lastFuncCall;

    uint public val;
    function setVal(uint newVal) public {
        val = newVal;
    }
//0x3d4197f00000000000000000000000000000000000000000000000000000000000000001
    receive() external payable {
        lastValSent = msg.value;
        lastFuncCall = "receive";
    }


    fallback() external payable {
        lastValSent = msg.value;
        lastFuncCall = "fallback";
    }
}