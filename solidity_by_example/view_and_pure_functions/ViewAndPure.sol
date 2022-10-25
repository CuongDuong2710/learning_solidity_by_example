// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ViewAndPure {
  uint public x = 1;
  
  // ----- VIEW functions -----
  // not change value of x
  function addToX(uint y) public view returns (uint) {
    return x + y;
  }

  /* 
  TypeError: Function cannot be declared as view because this expression (potentially) modifies the state.
    x += 1;
  */
  function updateX() public view {
    x += 1;
  }

  function foo() public {
  }

  /* 
  TypeError: Function cannot be declared as view because this expression (potentially) modifies the state.
    foo();
  */
  function invalidViewFunc() public view {
    foo();
  }

  // ----- PURE functions -----
  /* 
  TypeError: Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
    return x + y; 
  */
  function addToX2(uint y) public pure returns (uint) {
    return x + y;
  }

  function add(uint i, uint j) public pure returns (uint) {
    return i + j;
  }

  function foo2() public {
  }

  /* 
  TypeError: Function cannot be declared as pure because this expression (potentially) modifies the state.
    foo2();
  */
  function invalidPureFunc() public pure {
    foo2();
  }
}