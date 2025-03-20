// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedFitnessTracker {
    struct User {
        address userAddress;
        uint256 totalWorkouts;
        uint256 earnedTokens;
    }
    
    mapping(address => User) public users;
    address public owner;
    uint256 public rewardPerWorkout = 10; // Number of tokens rewarded per workout
    
    event WorkoutLogged(address indexed user, uint256 totalWorkouts, uint256 earnedTokens);
    
    constructor() {
        owner = msg.sender;
    }
    
    function logWorkout() public {
        User storage user = users[msg.sender];
        user.userAddress = msg.sender;
        user.totalWorkouts++;
        user.earnedTokens += rewardPerWorkout;
        
        emit WorkoutLogged(msg.sender, user.totalWorkouts, user.earnedTokens);
    }
    
    function getUserData(address userAddress) public view returns (uint256, uint256) {
        User storage user = users[userAddress];
        return (user.totalWorkouts, user.earnedTokens);
    }
}
