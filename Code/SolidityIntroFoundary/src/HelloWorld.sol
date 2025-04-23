// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract HelloWorld{
    string public greeting = "Hello World!";

    constructor() {
        console.log(greeting);
    }
}
