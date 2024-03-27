// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    // Note: You can declare some state variable
    bool charlie = true;
    function register() external returns (uint256) {
        if(charlie == true){
            charlie = false;
            return 1234;
        }
        return 123;
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    function register() external view returns (uint256) {
        if(IClassroomV2(address(msg.sender)).isEnrolled()){
            return 123;
        }
        else
            return 1500;
    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    function register() external view returns (uint256) {
        if(gasleft() > 6800){
            return 1000;
        }
        else
            return 123;
    }
}
