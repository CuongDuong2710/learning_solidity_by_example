// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EtherUnits {
  uint public oneWei = 1 wei;
  uint public oneEther = 1 ether;

  function testOneWei() public pure returns (bool) {
    return 1 wei == 1;
  }

  function testOneEther() public pure returns (bool) {
    return 1 ether == 1e18 wei;
  }
}

/* If use `oneWei` in pure function

TypeError: Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
  return oneWei == 1;
 */