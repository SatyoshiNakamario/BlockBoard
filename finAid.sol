pragma solidity ^0.4.15;

/**
* http://solidity.readthedocs.io/en/develop/units-and-global-variables.html?highlight=block%20and%20transaction
* https://vomtom.at/solidity-send-vs-transfer/
- Variables for [school, government, studentID, aidAmount
Functions needed:
-() SEND( school, recipient) transcripts
-(modifiers) Check if authorizedViewer
-(modifiers) Check if authorizedEditor
-() Apply aid to balance
-() Send left over amount to student
-() Add new authorized viewer
*/

//Defining a financial aid contract
contract finAid {


   struct User{
       uint _govtSender;
   }

   struct School{
       address _school;
   }

   struct Student{
        address _studentID;
        mapping(address => bool) correctStudent; // Is this necessary?
   }
   struct FinAid{
       uint _awardedAmount;
   }

/**Global Variables */
   uint _balance = _studentID.balance;
   Schools[] schoolListA; // Type[] variableName;
   User[] authorizedReadersA;
   mapping(address => bool) userCanRead; //Short function check that returns if userCanRead
   User[] authorizedEditorA;
   mapping(address => bool) userCanEdit; //Short function check that returns if userCanEdit
   User[] authorizedPatronsA;
   mapping(address => bool) userCanDonate;


/**Modifiers */
   modifier onlyAuthorizedReaders(){
       if (userCanRead[msg.sender] == false){
           revert(); //  AKA Like throw exception --> was getting bug earlier
       }
       _; // AKA Go back to the original function
   }

    modifier onlyAuthorizedEditor(){
       if (userCanEdit[msg.sender] == false){
           revert();
       }
       _;
   }

    modifier onlyAuthorizedPatron(){
      if(userCanDonate[msg.sender] == false){
        revert;
      }
      _;
    }

/**Events */
   /*Authorize school or student or those with clearnace to read docu's; event()
   will create a log of */
   event NewReaderAuth(address whoAddedThem, address whoWasAdded);
   event Deposit(address _from, address _id, uint _awardedAmount);

/**Functions */

   function sendAid(uint _awardedAmount, address _school) onlyAuthorizedEditor() public {
       _inStudentID.send(_awardedAmount);
       /*address.send or address.tranfser? Also how does it know who it's coming from*/
   //   returns (bool); ...solidity.readdocs
   }
    /* Could ClientReceipt code work for sending cash monz?
    http://solidity.readthedocs.io/en/develop/contracts.html*/

   function newAuthReader(address _newUser) onlyAuthReader() public {
      authorizedReadersA.push(User({
          _school: _newUser
      }));
      isAuthUser[_newUser];
   //   NewUserAdded(msg.sender, _newUser);
  }

  // This should add authorizedPatrons who can donate as well, which may need further authorization restrictions in their own class
  function newAuthPatron(address _newPatron) onlyAuthPatron() public{
      authorizedPatronsA.push(User({
          _school: _newUser
        }));
        isAuthUser[_newPatron];

  }

   function extraAid(uint _awardedAmount, address _inStudentID) onlyAuthorizedEditor() public {
       //or would you do onlu
       _inStudentID.send(_awardedAmount);
//      returns (bool); @...solidity.readdocs
   }
   function applyAid(address _studentID, address currentSchool, uint _awardedAmount) onlyAuthUser() public{
       if(_awardedAmount <= 0 ) {  //maybe just = 0
           revert();
       }
       else {
           balance = balance - _awardedAmount;
           if (balance > 0 ) {
               extraAid(balance, studentID);
           }
       }

   }


}
