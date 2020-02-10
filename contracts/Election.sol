pragma solidity >=0.4.21 <0.7.0;

// Contract definition
contract Election {
    // Model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    // Store accounts that have voted
    mapping(address => bool) public voters;
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

    function vote (uint _candidateId) public {
        // Require that ther voter haven't voted before
        require(!voters[msg.sender], "Your vote already casted");

        // Require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate");

        // Record that voter has voted
        voters[msg.sender] = true;

        // Update candidate vote count
        candidates[_candidateId].voteCount ++;
    }
}