pragma solidity ^0.5.0;

contract drugTrack{
    address public owner;


    struct drug_details {
        string ownername;
        uint drugId;
        string drugName;
        string date;
        string mrp;
    }
    
    drug_details[] public drugs;
    uint[] public drugs_id;
    
    mapping(address => uint) owner_drug;
    
    constructor() public {
        owner = msg.sender;
    }
    
    
    function addDrug(string memory _owner,uint _drugId ,string memory _drugName,string memory _date,string memory _mrp) public returns (uint) {
        require(
            msg.sender == owner
        );
        drug_details(_owner,_drugId, _drugName, _date, _mrp);
        drugs_id[drugs_id.length] = _drugId;
        return _drugId;
    }
    
    
      function verify(uint _drugId) view public returns (bool){
        for(uint i = 0; i < drugs_id.length; i++){
            if(drugs_id[i] == _drugId){
                return true;
            }
        }
        return false;
    }
    
    
    
    
}