pragma solidity ^0.4.15;
import "./School.sol";

contract SchoolRegistry{

    address registryOwner;

    struct school{
        bytes32 schoolName;
        address schoolContract;
    }

    school[] registeredSchools;
    mapping(address => bool) inRegistry;

    function SchoolRegistry() public{
        registryOwner = msg.sender;
    }

    modifier onlyRegistryOwner(){
        if (msg.sender != registryOwner){
            revert();
        }
        _;
    }

    function addSchoolToRegistry(bytes32 _schoolName) onlyRegistryOwner public{
        address newSchool = new School(_schoolName);
        if (newSchool == 0x0) {revert();}
        registeredSchools.push(school({
            schoolName: _schoolName,
            schoolContract: newSchool
        }));
        inRegistry[newSchool] = true;
    }

    function schoolInRegistry(address _school) constant public returns(bool){
        inRegistry[_school];
    }
}
