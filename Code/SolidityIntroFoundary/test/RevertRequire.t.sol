// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import "../src/RevertRequire/Example.sol";

contract RevertRequireTest is Test {
    A public a;
    B public b;

    function setUp() public {
    b = new B();
    a = new A(address(b));

    vm.deal(address(a), 1.5 ether);   // Preload balance to A
}

function testRevertRequire() public {
    a.callB(); // No value attached

    assertEq(address(a).balance, 0.5 ether); // 1.5 - 1 = 0.5 ether remaining
    assertEq(address(b).balance, 0);         // B reverted, so no ether received
    assertEq(a.errorsCount(), 1);
}

}
