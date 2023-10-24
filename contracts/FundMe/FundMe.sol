// SPDX-License-Identifier: MIT

pragma solidity ^0.8.21;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256;

    uint256 minimumUSD = 25e18;


    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded; // can declare identifiers in mapping parameters

    function fund() public payable {
        require(msg.value.getConversionRate() >= minimumUSD,'Not enough USD'); // msg.value are in base wei. 18 decimal units
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

}
