// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.26;

import "forge-std/console.sol";

contract FunctionCallsDemo {
    uint256 public sum;
    uint256 public product;

    constructor(uint256 x, uint256 y) {
        (sum, product) = add(x, y);
        // console.log("Sum of %s and %s is %s", x, y, sum);
    }

    function add(uint256 a, uint256 b) private pure returns (uint256, uint256) {
        return (a + b, a * b);
    }
}