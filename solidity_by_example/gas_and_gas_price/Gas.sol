// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Gas {

  function testGasRefund() public view returns (uint) {
    return tx.gasprice;
  }

  uint public i = 0;

  function forever() public {
    while(true) {
      i += 1;
    }
  }
}