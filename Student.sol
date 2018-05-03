pragma solidity ^0.4.15;

contract Student {
    
    address schoolOwner;
    address selfStudent;
    bytes32 firstName;
    bytes32 lastName;
    bytes32 mailingAddress;
    bytes32 transcript;
    bool accntOnHold;
    uint aidAmnt;
    uint tuitionDue;
    
    struct User{
        address userID;
    }
    
    
    User[] authorizedToView;
    mapping(address => bool) canView;
    
    function Student(bytes32 _fName, bytes32 _lName, bytes32 _mailingAdd, bytes32 _transcript) public{
        schoolOwner = msg.sender;
        firstName = _fName;
        lastName = _lName;
        mailingAddress = _mailingAdd;
        transcript = _transcript;
        aidAmnt = 0;
        tuitionDue = 0;
    }
    
    modifier onlySchool{
        if (schoolOwner != msg.sender){
            revert();
        }
        _;
    }
    
    function setStudentAddress(address _studentAdd) onlySchool public{
        selfStudent = _studentAdd;
        authorizedToView.push(User({
            userID: _studentAdd
        }));
        canView[_studentAdd] = true;
    }
    
    modifier onlyStudent{
        if (selfStudent != msg.sender){
            revert();
        }
        _;
    }
    
    modifier onlyAuthViewer{
        if (canView[msg.sender] == false){// && msg.sender != selfStudent){
            revert();
        }
        _;
    }
    
    
    function newAuthViewer(address _newUser) onlySchool public{
        authorizedToView.push(User({
            userID: _newUser
        }));
        canView[_newUser] = true;
    }
    
    function updateTranscript(bytes32 _updatedTscript) onlySchool public{
        transcript = _updatedTscript;
    }
    
    function viewTranscript() onlyAuthViewer public constant returns(bytes32){
        return transcript;
    }
    
    function changeHold() onlySchool public{
        accntOnHold = !accntOnHold;
    }
    
    function changeFinances(uint _newTuition, uint _newAid) onlySchool public{
        tuitionDue = _newTuition;
        aidAmnt = _newAid;
    }
    
    function checkHold() constant public returns(bool){
        if (msg.sender != selfStudent && msg.sender != schoolOwner){ revert(); }
        return accntOnHold;
    }
    
    function checkTuition() constant public returns(uint){
        if (msg.sender != selfStudent){// && msg.sender != schoolOwner){ 
            revert(); }
        return tuitionDue;
    }
    
    function checkAid() constant public returns(uint){
        if (msg.sender != selfStudent){// && msg.sender != schoolOwner){ 
            revert(); }
        return aidAmnt;
    }
    
    function recieveFunds() public payable{
        
    }
    
    function getBalance() onlyStudent constant public returns(uint){
        return this.balance;
    }
    
    function payTuition(uint _amount) onlyStudent public{
        if(_amount > this.balance || _amount > tuitionDue) { revert(); }
        schoolOwner.transfer(_amount);
        tuitionDue = tuitionDue - _amount;
    }
        
}
