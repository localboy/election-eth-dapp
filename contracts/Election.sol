pragma solidity >=0.4.21 <0.7.0;

// Contract definition
contract Election {
    // Model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    // Store candidate
    // Fetch candidate
    mapping(uint => Candidate) public candidates;
    // Store candidates count
    uint public candidatesCount;
    // Constructor

    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}