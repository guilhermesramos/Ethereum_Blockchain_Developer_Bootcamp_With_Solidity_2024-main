pragma solidity ^0.5.13;

contract ExceptionExample {
    mapping (address => uint) public balanceReceived;
    
    function receiveMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender],"You don't have enough ether!"); 
        //'require' is often used to check input validity. 'assert' is instead used to check internal variables state 
        //before they are changed, e.g. to avoid rollover mistakes
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}
