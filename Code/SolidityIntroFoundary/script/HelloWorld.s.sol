// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {HelloWorld} from "../src/HelloWorld.sol";

contract HelloWorldScript is Script {
    HelloWorld public hello;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        hello = new HelloWorld();

        vm.stopBroadcast();
    }
}
