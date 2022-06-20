// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract Donation {
    struct donate {
        uint256 id;
        string name;
        uint amount;
        address sender;
    }

    donate [] public Alldonaters;
    mapping(uint => donate) public Record;

    function Donater( uint256 id ,string memory name ) public payable {
            Record[id] = donate( id, name, msg.value, msg.sender);
            Alldonaters.push(donate(id, name, msg.value,msg.sender));
    }


    function DeleteDonation ( uint index ) public{
        // Alldonaters.pop(donate(id, name, msg.value, msg.sender ));
        Alldonaters[index] = Alldonaters[Alldonaters.length-1];
        Alldonaters.pop();
    }


    function UpdateDonation( uint256 id ,string memory name ) public payable {
            Record[id] = donate( id, name, msg.value, msg.sender);
            Alldonaters.push(donate(id, name, msg.value,msg.sender));
    }

    function FindSpecific(uint256 id) external view returns( donate memory){
       return Record[id] ;
    }

    
    function CountAll () public view returns(uint) {
        return Alldonaters.length;
    }


}

