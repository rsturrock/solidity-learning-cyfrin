// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStoragePractice.sol";

contract AddFiveStorage is SimpleStorage {
    // + 5
    // overrides
    // virtual override

    function store(uint256 _newNumber) public override {
        favoriteNumber = _newNumber + 5;
    }
}
