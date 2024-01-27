// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


library PriceConvertor {
    function getConvertedValue(uint256 _value) public view returns (uint256) {
        return (getPrice() * _value) / 1e18;
    }

    function getPrice() public view returns (uint256) {
        AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = dataFeed.latestRoundData();
        return uint256(answer * 1e10);
    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return dataFeed.version();
    }
}