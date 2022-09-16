// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SendEther {
    constructor() payable {}

    receive() external payable {}

    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) external payable {
        // omit data in return
        (bool success, ) = _to.call{value: msg.value}("");
        require(success, "Failed to send Ether");
    }
}

contract ReceiveEther {
    event Log(uint amount, uint gas);

    receive() external payable {
      emit Log(msg.value, gasleft());
    }
}
