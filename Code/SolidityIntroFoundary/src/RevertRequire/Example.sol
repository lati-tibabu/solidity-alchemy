// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract A {
    address b;
    uint256 public errorsCount = 0;

    constructor(address _b) {
        b = _b;
    }   

    function callB() external payable {
        (bool success, ) = b.call{value: 1 ether}("");

        if (!success) {
            errorsCount++;
        }
    }
}

contract B {
    uint256 public x = 0;

    error DoNotPayMe();

    receive() external payable {
        x = 15;
        revert DoNotPayMe();
    }
}
