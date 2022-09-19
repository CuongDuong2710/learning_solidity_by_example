// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TestCall {
    string public message;
    uint256 public x;

    event Log(string message);

    fallback() external payable {
        emit Log("fallback was called");
    }

    function foo(string memory _message, uint256 _x)
        external
        payable
        returns (bool, uint256)
    {
        message = _message;
        x = _x;
        return (true, 999);
    }
}

contract Call {
    event Response(bool success, bytes data);

    function callFoo(address _test) external payable {
        // 1st output is boolean whether call success or failed
        // 2nd output is return by foo() and encoded in bytes memory
        (bool success, bytes memory data) = _test.call{value: 111}(
            abi.encodeWithSignature("foo(string, uint256)", "call foo", 123)
        ); // send 1st 'message', 2nd '_x' params
        require(success, "call failed");

        emit Response(success, data);
    }

    // Calling a function that does not exist triggers the fallback function.
    function callDoesNotExist(address _addr) public {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("doesNotExist()")
        );
        require(success, "call failed");

        emit Response(success, data);
    }
}
