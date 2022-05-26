//SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;

import "hardhat/console.sol";

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Twitter {

    using SafeMath for uint256;

    uint public tweetCount;

    struct Tweet {
        address author;
        string topic;
        string content;
        uint timestamp;
    }

    struct Comment {
        address author;
        string content;
    }

    Tweet[] public tweets;
    Comment[] public comments;

    mapping(string => address) public tweetToAddress;

    function createTweet(string memory _topic, string memory _content) public {
        require(bytes(_topic).length > 0, "Please write a topic");
        require(bytes(_content).length > 0, "Please write content");
        tweets.push(Tweet(msg.sender, _topic, _content, block.timestamp));
        tweetCount.add(1);
    }

    function createComment(string memory _content) public {
        
    }

    function getTweet() external view returns(Tweet[] memory) {
        return tweets;
    }

    function getComment() external view returns(Comment[] memory) {
        return comments;
    }
}