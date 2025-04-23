// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract BasicDataTypesDemo {

    //boolean
    bool public isActive = true;

    // unsigned Integers
    uint8 public maxSmallUint = 255;
    uint256 public largeUint = 1000000;

    // signed Integers
    int8 public smallSignedInt = -100;
    int256 public largeSignedInt = 123456789;

    // string Literal
    string public greeting = "Hello Blockchain!";

    // bytes Literal (dynamic)
    bytes public dynamicBytes = "Dynamic Bytes!";

    // fixed-size Bytes (string must fit into 32 bytes)
    bytes32 public fixedBytes = "Short Fixed String";

    // enum Type
    enum Status { Idle, Working, Completed }
    Status public currentStatus = Status.Idle;

    constructor() {
        console.log("Boolean isActive:");
        console.logBool(isActive);

        console.log("Unsigned Integers -> uint8:");
        console.logUint(maxSmallUint);
        console.log("uint256:");
        console.logUint(largeUint);

        console.log("Signed Integers -> int8:");
        console.logInt(smallSignedInt);
        console.log("int256:");
        console.logInt(largeSignedInt);

        console.log("String greeting:");
        console.log(greeting);

        console.log("Bytes (dynamic):");
        console.log(string(dynamicBytes));

        console.log("Fixed-size Bytes:");
        console.logBytes32(fixedBytes);

        console.log("Enum currentStatus:");
        console.logUint(uint(currentStatus));
    }

    function updateStatus(Status newStatus) public {
        currentStatus = newStatus;
        console.log("Updated Status to:", uint(currentStatus));
    }
}