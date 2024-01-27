// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./PriceConvertorLibrary.sol";


contract FundMe {
    using PriceConvertor for uint256;

    uint256 minimumValueInUsd = 50 * 1e18;
    mapping(address => uint256) public FunderAddressToAmount;
    address[] public funders;

    function fund() public payable {
        require(msg.value.getConvertedValue() >= minimumValueInUsd, "Did not send enough");
        FunderAddressToAmount[msg.sender] = msg.value;
        funders.push(msg.sender);
    }
}