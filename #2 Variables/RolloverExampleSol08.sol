// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

// With Solidity 0.8.0, values cannot roll over in either direction and an error is given in the console.
// If you still want the variables to roll over, you can wrap them in 'unchecked'as follows:
/*

    function decrement() public {
        unchecked {
            myUint8--;
        }
    }

    function increment() public {
        unchecked {
            myUint8++;
        }
    }

*/

contract RolloverExample2 {
    uint8 public myUint8;

    function decrement() public {
        myUint8--;
    }

    function increment() public {
        myUint8++;
    }
}
