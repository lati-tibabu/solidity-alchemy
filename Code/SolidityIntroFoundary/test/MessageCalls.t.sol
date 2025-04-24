//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

// import "forge-std/Test.sol";
// import "forge-std/console.log";

import {Test, console} from "forge-std/Test.sol";
import "../src/MessageCalls/Example.sol";

contract MessageCalls is Test {
    A public a;
    B public b;

    function setUp() public {
        b = new B();
        a = new A{ value: 1 ether }(address(b));
    }

    function testMessageCall() public {
        assertEq(address(a).balance, 1 ether);
        a.payHalf();
        assertEq(address(a).balance, 0.5 ether);
        console.log("A's balance 1st half pay: ", address(a).balance);
        a.payHalf();
        console.log("A's balance 2nd half pay: ", address(a).balance);

        console.log("B's balance after 2nd pay: ", address(b).balance);
        
        a.payHalf();
        console.log("A's balance 3rd half pay: ", address(a).balance);

        console.log("B's balance after 3rd pay: ", address(b).balance);

    }
}