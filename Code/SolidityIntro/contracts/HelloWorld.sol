// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    string public greeting = "Hello from Hardhat!";

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }
}
