//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";

import "../src/MessageCalls/Example.sol";

contract ExampleScript is Script {
    A public a;
    B public b;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        b = new B();
        a = new A(address(b));

        console.log("Address of contract A: %s", address(a));
        console.log("Address of contract B: %s", address(b));

        vm.stopBroadcast();
    }
}