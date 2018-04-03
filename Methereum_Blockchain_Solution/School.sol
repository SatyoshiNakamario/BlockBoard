pragma solidity ^0.4.15;
import "./Student.sol";

contract School{
    
    address registryID;
    address schoolOwner;
    bytes32 schoolName;
    
    address[] studentContracts;
    
    function School(bytes32 _name) public{
        registryID = msg.sender;
        schoolName = _name;
    }
    
    function setSchoolOwner(address _schoolAdd) public{
        if (msg.sender != registryID) { revert(); }
        schoolOwner = _schoolAdd;
    }
    
    modifier onlySchoolOwner{
        if (msg.sender != schoolOwner){ 
            revert();
        }
        _;
    }
    
    function getName() public constant returns(bytes32){
        return schoolName;
    }
    
    function newStudent(bytes32 _fName, bytes32 _lName, bytes32 _mailingAdd, bytes32 _transcript) onlySchoolOwner public{
        address studentAddress = new Student( _fName, _lName, _mailingAdd, _transcript);
        if (studentAddress == 0x0) {revert();}
        studentContracts.push(studentAddress);
        
    }
    
    function transferStudent(address _studentContract) onlySchoolOwner public{
        studentContracts.push(_studentContract);
    }
    
    function getBalance() onlySchoolOwner constant public returns(uint){
        return this.balance;
    }
    
}
