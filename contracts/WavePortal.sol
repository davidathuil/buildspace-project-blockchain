//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {

uint256 totalWaves;

    event NewWave(address indexed from, uint256 timestamp, string message);

    /*
     * I created a struct here named Wave.
     * A struct is basically a custom datatype where we can customize what we want to hold inside it.
     */
    struct Wave {
        address waver; // The address of the user who waved.
        string message; // The message the user sent.
        uint256 timestamp; // The timestamp when the user waved.
    }

    /*
     * I declare a variable waves that lets me store an array of structs.
     * This is what lets me hold all the waves anyone ever sends to me!
     */
    Wave[] waves;

    constructor() {
        console.log(" i am a contract and i m smart");
        
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
    function wave() public {
        totalWaves += 1;
        
        console.log("%s waved w/ message %s", msg.sender, _message);

        /*
         * This is where I actually store the wave data in the array.
         */
        waves.push(Wave(msg.sender, _message, block.timestamp));

        
        emit NewWave(msg.sender, block.timestamp, _message);
    }
    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }
}
