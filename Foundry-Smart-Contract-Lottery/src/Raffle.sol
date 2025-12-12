// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
 * @title A Sample Raffle Contract
 * @author T Prem
 * @notice This Contract is for creating a sample raffle
 * @dev Implements Chainlink VRFv2.5
 */

contract Raffle {
    /* ERRORS */
    error Raffle__SendMoreToEnterRaffle();x

    uint256 private immutable i_enteranceFee;
    address payable[] private s_players;

    constructor(uint256 enteranceFee) {
        i_enteranceFee = enteranceFee;
    }

    function enterRaffle() public payable {
        // require(msg.value >= i_enteranceFee, "Not Enough ETH Send");
        if (msg.value < i_enteranceFee) {
            revert Raffle__SendMoreToEnterRaffle();
        }
        s_players.push(payable(msg.sender));
    }

    function pickWinner() public {}

    /** Getter Functions */

    function getEnteranceFee() external view returns (uint256) {
        return (i_enteranceFee);
    }
}

// Style Guide:

// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions
