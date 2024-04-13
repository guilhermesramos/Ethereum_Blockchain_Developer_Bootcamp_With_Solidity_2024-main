pragma solidity ^0.5.13;

contract WorkingWithVariables {
    uint256 public myUint;  // By default the uint variable is set to 0
                            // 'U' stands for unsigned (capable of representing only non-negative numbers)
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    
    bool public myBool; // By default the bool variable is set to 'false'
    
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
    
    uint8 public myUint8; // uint8 type goes from 0 to 255 in value. This variable wraps around, going from 255 to 0 and from 0 to 255
    
    function incrementUint() public {
        myUint8++;
    }
    
    function decrementUint() public {
        myUint8--;
    }
    
    address public myAddress; // By default the address variable is a 0 address holding a 20 bytes value  ->  0x0000000000000000000000000000000000000000

    function setAddress(address _address) public {
        myAddress = _address; 
    }
    
    function getBalanceOfAddress() public view returns(uint) {  // A view function is a function that can only read, and not write.
                                                                // This function returns the balance of the address in wei
                                                                // Everything that you do in Solidity is going to be in wei. 1 ether is 1e18 wei
        return myAddress.balance;
    }
    
    string public myString = 'hello world'; // Strings in Solidity are byte arrays
                                            // By default string variables are empty
                                            // In solidity strings cannot be concatenated nor be searched, no string function to replace part of the string
                                            /* Working with strings can be very expensive in terms of gas to process the transactions. To avoid high gas fees 
                                               when working with strings, strings can be stored outside the blockchain and checked against with a hash of the 
                                               string, to verify that the string is not changed. You cannot access a specific character from a string in Solidity */
    
    function setMyString(string memory _myString) public { // String variables are stored in memory and not in storage variables like for uint, bool or address
        myString = _myString;
    }
}
