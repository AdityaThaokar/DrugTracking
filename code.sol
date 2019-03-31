pragma solidity ^0.4.18;
pragma experimental ABIEncoderV2;

contract Coursetro {
  
   string fName;
   uint drug_id;
    string oname; 
    
      struct Instructor {
       string fName;
       uint drug_id;
        string oname;
    }
mapping (uint => string) public drug_owner_list;

uint[] public drug_count;

   event Drug(
       string name,
       uint drug_id,
       string oname
    );

  mapping(uint => string[]) public Record;

  uint[] keysNames;


    function getTransactions(uint drug_id) public view returns (string[]) {
    return  Record[drug_id];

    }

    function addTransactions(uint drug_id, string oname) public returns (string[]){
        Record[drug_id].push(oname);
        return getTransactions(drug_id);
    }
    
     function getTransactionsLength() public view returns (uint) {

        return Record[drug_id].length;

    }

 function setDrug(string _fName, uint _drug_id ,string _oname)  {
       fName = _fName;
       drug_id = _drug_id;
       oname = _oname;
       Instructor(_fName, _drug_id ,_oname);
       drug_owner_list[drug_id] = fName;
       drug_count.push(drug_id);
       keysNames.push(drug_id);
       Record[drug_id].push(oname);
    }
   
   function getDrug() view public returns (string, uint , string) {
       return (fName, drug_id ,oname);
   }
   
   function validateDrug(uint _drug_id) view public returns (bool){
    for(uint i = 0; i < drug_count.length; i++) {
      if (drug_count[i] == _drug_id) {
         return true;
      }
    }
    return false;
  }
  
    modifier drugExist(uint _drug_id ) {
     for(uint index = 0; index < drug_count.length; index++){
            if(drug_count[index] == _drug_id){
                _;
                return;
            }
        }
        revert(); 
    }


  function updateOwner(string _fName, uint _drug_id ,string _onamenew) drugExist(_drug_id){
       fName = _fName;
       drug_id = _drug_id;
       oname = _onamenew;
       Instructor(_fName, _drug_id ,_onamenew);
       drug_owner_list[drug_id] = fName;
       drug_count.push(drug_id);
       keysNames.push(drug_id);
       Record[drug_id].push(oname);
  }
  
   function count() view public returns (uint){
       return drug_count.length;
   }
  
  function Trace(uint _drug_id){
      for()
      
  }
   
}