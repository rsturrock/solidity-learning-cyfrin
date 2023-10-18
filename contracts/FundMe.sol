// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD
// contract address = 0x50a05557BAe7ff527cd8545de4E5bE4439c844ce
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUSD = 5e18;

    function fund() public payable {
        // Allow users to send $
        // Have a minimum $ sent $5
        // 1. How do we send ETH to this?

        require(getConversionRate(msg.value) >= minimumUSD, "didn't send enough USD"); // 1e18 = 1 ETH = 1000000000000000000 = 1 * 10^18.
    

        

        // What is a revert?
        // Undo any actions that have been done and send the remaining gas back
    }

    // function withdraw() public {}

    function getPrice() public view returns (uint256) {
        // address = 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        // (, int256 answer,,,) = priceFeed.latestRoundData();
        (, int256 answer,,,) = priceFeed.latestRoundData();
        return uint256(answer * 1e10);
    }

    function getVersion() view public returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }


    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }


    function getMessageValue() external payable returns (uint) {
        // Return the value of msg.value
        return msg.value;
    }


}
