// SPDX-License-Identifier: MIT

pragma solidity ^0.8.21;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

    function getPrice() internal view returns (uint256) {
        AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 answer,,,) = dataFeed.latestRoundData();
        return uint256(answer) * 1e10;
    }

    function getVersion() internal view returns (uint256) {
        AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return dataFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
       uint256 ethAmountInUsd = ethAmount * getPrice();
       ethAmountInUsd = ethAmountInUsd / 1e18;
       return ethAmountInUsd; 
    }
}
