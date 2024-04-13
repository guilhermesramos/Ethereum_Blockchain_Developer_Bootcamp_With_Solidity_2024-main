// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

/*

Strings are actually Arrays, very similar to a bytes-array. If that sounds too complicated, let me break down some quirks for you that are somewhat unique to Solidity:

Natively, there are no String manipulation functions.
No even string comparison is natively possible
There are libraries to work with Strings
Strings are expensive to store and work with in Solidity (Gas costs, we talk about them later)
As a rule of thumb: try to avoid storing Strings, use Events instead (more on that later as well!)

*/


contract StringExample {
    string public myString = 'hello world!';

    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}
