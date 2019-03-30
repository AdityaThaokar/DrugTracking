pragma solidity ^0.5.0;

contract drugTrack{
    address public owner;


    struct drug_details {
        bytes32 ownername;
        uint drugId;
        bytes32 drugName;
        bytes32 date;
        bytes32 mrp;
    }
    
    drug_details[] public drugs;
    uint[] public drugs_id;
    
    mapping(address => uint) owner_drug;
    
    constructor() public {
        owner = msg.sender;
    }
    
    
    function addDrug(bytes32 _owner,uint _drugId ,bytes32 _drugName,bytes32 _date,bytes32 _mrp) public returns (uint) {
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