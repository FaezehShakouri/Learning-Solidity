// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;


struct People {
    uint256 favoriteNumber;
    string name;
}

contract SimpleStorage {
    uint256 favoriteNumber;
    People[] public people;
    mapping (string => uint256) public  nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual  {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(uint256 _favoriteNumber, string memory _name) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
    
}