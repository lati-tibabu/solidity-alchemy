// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.26;

import {Script, console} from "forge-std/Script.sol";
import {StorageVariable} from "../src/BasicDataTypes/storageVariables.sol";

contract StorageVariableScript is Script {
    StorageVariable public demo;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        demo = new StorageVariable();

        vm.stopBroadcast();
    }
}