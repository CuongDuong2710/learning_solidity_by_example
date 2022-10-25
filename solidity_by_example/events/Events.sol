// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Event {
    // Event declaration
    event Log(string message, uint256 val);
    // Up to 3 parameters can be indexed.
    // Indexed parameters helps you filter the logs by the indexed parameter
    event IndexedLog(address indexed sender, uint256 val);
    event Message(address indexed _from, address indexed _to, string message);

    function example() external {
        emit Log("foo", 123);
        emit IndexedLog(msg.sender, 789);
    }

    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}
