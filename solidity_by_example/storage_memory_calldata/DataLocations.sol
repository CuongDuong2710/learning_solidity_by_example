// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract DataLocations {
    struct MyStruct {
        uint256 foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function example(uint256[] calldata y) external returns (uint256[] memory) {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        // storage for modify and saving into blockchain
        MyStruct storage oneStruct = myStructs[msg.sender];
        oneStruct.text = "hello";

        // memory for modify without saving into blockchain
        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456;

        // calldata without copy new array, save gas
        _internal(y);

        uint256[] memory arr = new uint256[](3);
        arr[0] = 111;
        return arr;
    }

    function _internal(uint256[] calldata y) private pure {
        uint256 x = y[0];
    }
}
