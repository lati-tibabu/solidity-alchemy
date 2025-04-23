// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {FunctionCallsDemo} from "../src/Functions/index.sol";

contract FunctionCallsScripts is Script {
    FunctionCallsDemo public demo;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        demo = new FunctionCallsDemo(5, 10);
        console.log("(run from script)Sum of 5 and 10 is %s", demo.sum());
        console.log("(run from script)Product of 5 and 10 is %s", demo.product());
        
        vm.stopBroadcast();
    }
}