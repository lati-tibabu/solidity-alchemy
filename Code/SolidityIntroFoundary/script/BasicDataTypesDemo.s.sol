// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {BasicDataTypesDemo} from "../src/BasicDataTypes/index.sol";

contract BasicDataTypesScript is Script {
    BasicDataTypesDemo public demo;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        demo = new BasicDataTypesDemo();

        vm.stopBroadcast();
    }
}
