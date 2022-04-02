// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.10;
contract VoteContract {
    address owner;
    function voting()public {
        owner=msg.sender;
    }
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    event insertCandidate(uint candidateID);

    struct Voter {
        uint candidateID; 
        bytes32 voteID;    
    }

    struct Proposal {
        bytes32 candidate;   
        uint voteCount;  
    }

    uint numberOfCandidates;
    uint numberOfVoters;

    mapping (uint => candidate) candidates;
    mapping (uint => voter) voters;

    function addCandidate(bytes32 candidate) onlyOwner public {
        uint candidateID = numberOfCandidates++;
        candidates[candidateID] = Proposal(candidate,true);
        insertCandidate(candidateID);
    }

    function vote(bytes32 uid, uint candidateID) public {
            uint voterID = numberOfVoters++; 
            voters[voterID] = Voter(voteID,candidateID);
        }
    }

  function voteBalance(uint candidateID) view public returns (uint) {
        uint voteCount = 0; 
        for (uint i = 0; i < voteCount; i++) {
            if (voters[i].candidateIDVote == candidateID) {
                voteCount++;
            }
        }
        return voteCount; 
    }

    function getNumberOfCandidates() public view returns(uint) {
        return numberOfCandidates;
    }

    function getNumberOfVoters() public view returns(uint) {
        return numberOfVoters;
    }
    // returns candidate information, including its ID, name, and party
    function getCandidate(uint candidateID) public view returns (uint,bytes32) {
        return (candidateID,candidates[candidateID].name);
    }
}
