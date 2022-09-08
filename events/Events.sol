// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Event {
    event Log(string message, uint256 val);
    // up to 3 index
    event IndexedLog(address indexed sender, uint256 val);

    function example() external {
        emit Log("foo", 123);
        emit IndexedLog(msg.sender, 789);
    }
}
