// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Base {
    uint256 private x = 0;
    uint256 internal y = 1;
    uint256 public z = 2;

    function privateFunc() private pure returns (uint256) {
        return 1;
    }

    function internalFunc() internal pure returns (uint256) {
        return 100;
    }

    function publicFunc() public pure returns (uint256) {
        return 200;
    }

    function externalFunc() external pure returns (uint256) {
        return 300;
    }

    function example() external view {
        x + y + z;

        privateFunc();
        internalFunc();
        publicFunc();

    /* DeclarationError: Undeclared identifier. "externalFunc" is not (or not yet) visible at this point.
        --> contracts/Visibility,sol.sol:32:9:
        externalFunc(); 
    */
    // externalFunc();
    // this.externalFunc(); // don't do it
    }
}

contract Child is Base {
    function example2() external view{
        y + z;

        internalFunc();
        publicFunc();

        /* DeclarationError: Undeclared identifier.
  --> contracts/Visibility,sol.sol:44:9:
44 |         externalFunc();
   |         ^^^^^^^^^^^^ */
        // externalFunc();
    }
}
