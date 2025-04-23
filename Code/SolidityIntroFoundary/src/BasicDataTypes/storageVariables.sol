// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract StorageVariable {
    uint256 a = 100;
    uint256 b = type(uint256).max;
    bool c = true; 

    constructor () {

        uint256 x;
        bool y;
        assembly{
            x:=sload(0x0)
            y:=sload(0x2)
            
        }
        console.log("Storage variable a: ", a);
        console.log("Storage variable b: ", b);
        console.log("Storage variable c: ", c);

        console.log("Storage variable x: ", x);
        console.log("Storage variable y: ", y);
    }
}
