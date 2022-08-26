// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract StateVariables {
  string public text; // state store at Storage

/*   
If set 'storage' for parameter

TypeError: Data location must be "memory" or "calldata" for parameter in function, but "storage" was given.
  function set(string storage _text) public {
*/

  function set(string memory _text) public {
    text = _text; // change state
  }

  // do not change state, use `view` or `pure`
  // `view` does not write to blockchain
  // `pure` also does not write to blockchain and does not read state variables
  function get() public view returns (string memory) {
    return text;
  }
}