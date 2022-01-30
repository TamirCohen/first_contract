// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;
contract Adoption{
    uint public constant petNumber = 16;
    address[petNumber] public adopters;
    
    function adopt(uint petId) public returns (uint){
        require(petId >0 && petId < petNumber);
        require(adopters[petId] == address(0));
        adopters[petId] = msg.sender;
        return petId;
    }

    function readopt(uint petId) public returns (uint){
        require(petId >0 && petId < petNumber);
        require(adopters[petId] == msg.sender);
        adopters[petId] = address(0);
        return petId;
    }
    
    function getAdopters() public view returns (address[petNumber] memory){
        return adopters;
    }
}