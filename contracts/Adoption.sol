// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;
contract Adoption{
    uint public constant petNumber = 16;
    address[petNumber] public adopters;
    
    function adopt(uint petId) public returns (uint){
        require(petId >=0 && petId < petNumber, "Index Out of range");
        require(adopters[petId] == address(0), "Pet allready adopted");
        adopters[petId] = msg.sender;
        return petId;
    }

    function readopt(uint petId) public returns (uint){
        require(petId >=0 && petId < petNumber, "Index Out of range");
        require(adopters[petId] == msg.sender, "Pet not adopted by sender");
        adopters[petId] = address(0);
        return petId;
    }
    
    function getAdopters() public view returns (address[petNumber] memory){
        return adopters;
    }
}