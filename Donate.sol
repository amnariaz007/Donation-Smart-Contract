// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract Donation {
    struct donate {
        uint256 id;
        string name;
        uint amount;
        address sender;
    }

    uint public countAll;

    mapping(uint => donate) public AllDonators;

    function Donater( uint256 id ,string memory name ) public payable {
            AllDonators[id] = donate( id, name, msg.value, msg.sender);     
             countAll += 1; 
    }


    function DeleteDonation (uint256 id ) public  {
          AllDonators[id] = donate( id, "", 0, 0x0000000000000000000000000000000000000000);     
           countAll -= 1; 
    }

     function UpdateDonation( uint256 id ,string memory name ) public payable {
            AllDonators[id] = donate( id, name, msg.value, msg.sender);   
    }


    function FindSpecific(uint256 id) external view returns( donate memory){
       return AllDonators[id] ;
    }

    
    


}
