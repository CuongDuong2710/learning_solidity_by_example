// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Function {
    // INPUT
    /* If input is mapping
    TypeError: Types containing (nested) mappings can only be parameters or return variables of internal or library functions.
  */
    function mapInput(mapping(uint256 => uint256) memory map) public {}

    function multiDimFixedSizeArrayInput(uint256[9][9] memory _arr) public {}

    // In newest pragma, multi dynamic size array is valid
    function multiDimDynamicSizeArrayInput(uint256[][] memory _arr) public {}

    uint256 MAX_ARR_LENGTH = 10;

    function arrayInput(uint256[] memory _arr) public {
        if (_arr.length > MAX_ARR_LENGTH) {
            // check upper bound
            // throw error
        }
    }

    // OUTPUT
    mapping(uint256 => uint256) map;
    uint256[] arr;
    uint256[9][9] arr2DFixed;
    uint256[][] arr2D;

    /* If output is mapping
    TypeError: Types containing (nested) mappings can only be parameters or return variables of internal or library functions.
  */
    function mapOutput() public returns (mapping(uint256 => uint256) memory) {}

    function multiDimFixedSizeArrayOutput()
        public
        view
        returns (uint256[9][9] memory)
    {
        return arr2DFixed;
    }

    // In newest pragma, multi dynamic size array is valid
    function multiDimDynamicSizeArrayOutput()
        public
        view
        returns (uint256[][] memory)
    {
        return arr2D;
    }

    function arrayOutput() public view returns (uint256[] memory) {
        return arr;
    }

    // funtion can return multiple values
    function returnMany()
        public
        pure
        returns (
            uint256,
            bool,
            uint256
        )
    {
        return (1, true, 2);
    }

    // Return values can be named.
    function named()
        public
        pure
        returns (
            uint256 x,
            bool b,
            uint256 y
        )
    {
        return (1, true, 2);
    }

    // Return values can be assigned to their name.
    // In this case the return statement can be omitted.
    function assigned()
        public
        pure
        returns (
            uint256 x,
            bool b,
            uint256 y
        )
    {
        x = 1;
        b = true;
        y = 2;
    }

    // Destructuring Assignment
    // Use destructuring assignment when calling another
    // function that returns multiple values.
    function destructuringAssignments()
        public
        pure
        returns (
            uint256,
            bool,
            uint256,
            uint256,
            uint256
        )
    {
        (uint256 i, bool b, uint256 j) = returnMany();

        // values can be left out
        (uint256 x, , uint256 y) = (4, 5, 6);

        return (i, b, j, x, y);
    }
}
