// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Constructor {
    uint256 public x;
    uint256 public y;

    address public owner;
    uint256 public createAt;

    constructor(uint256 _x, uint256 _y) {
        x = _x;
        y = _y;

        owner = msg.sender;
        createAt = block.timestamp; // unix
    }
}
