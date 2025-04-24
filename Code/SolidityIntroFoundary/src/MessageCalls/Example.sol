// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract A{
    address b;

    constructor(address _b) payable {
        b = _b;
        // console.log("ether to be sent", msg.value);
        // console.log("balance", address(this).balance);
        // console.log("b address: ", b);
        // console.log("a address: ", address(this));
    } 

    function payHalf() external {
        uint256 balance = address(this).balance;
        (bool success, ) = b.call{ value : balance / 2 }("");
        require(success);
    }
}

contract B{
    receive() external payable {}
} 