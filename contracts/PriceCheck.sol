// SPDX-License-Identifier: MIT
// dApp that displays ETH price in USD
// sepolia contract address = 0xdf6Dd07d884AfDD500C8A1F22ED6b59dA58ACD68 

pragma solidity ^0.8.19;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceCheck {

AggregatorV3Interface dataFeed;

constructor() {
    dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
}

function checkPrice() public view returns (int256) {
    (   
        /*uint80 roundId*/, 
         int256 answer, 
        /*uint256 startedAt*/, 
        /*uint256 updatedAt*/, 
        /*uint80 answeredInRound*/
    ) = dataFeed.latestRoundData();

    return answer;
}



}
