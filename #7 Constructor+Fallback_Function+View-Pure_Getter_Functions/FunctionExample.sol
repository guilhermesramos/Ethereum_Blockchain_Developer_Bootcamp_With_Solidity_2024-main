pragma solidity ^0.5.13;

contract FunctionsExample {
    
    mapping (address => uint) public balanceReceived;
    
    address payable owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function getOwner() public view returns(address) {
        return owner;
    }
    
    // A pure function does not interact with storage variables and can only call other 
    // pure functions but cannot call other functions that interact with storage variables.
    function convertWeiToEther(uint _amountInWei) public pure returns(uint) {
        return _amountInWei / 1 ether;
    }
    
    function destroySmartContract() public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(owner);
    }
    
    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender],"not enough funds."); 
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
    
    // Fallback function - A sort of catch all function when there is no payable keyword 
    // attached to the function or there is no function that matches, the fallback function 
    // avoids the error to be treated as an exception, in case you do not interact with any 
    // function or there is no function interactiing with the data flow.
    
    // e.g. sending money to the smart contract directly from Metamask, without interacting with receveMoney()
    function () external payable {
        receiveMoney();
    }
}
