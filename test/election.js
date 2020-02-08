var Election = artifacts.require("./Election.sol");

contract("Election", function(accounts) {
    
    it("Initializes with two candidates", function(){
        return Election.deployed().then(function(instance){
            return instance.candidatesCount();
        }).then(function(count){
            assert.equal(count, 2)
        })
    })

    it("Initializes the candidate with the correct values", function(){
        return Election.deployed().then(function(instance){
            electionInstance = instance;
            return electionInstance.candidates(1);
        }).then(function(candidate){
            assert.equal(candidate.id, 1, "Contain the correct is");
            assert.equal(candidate.name, "Candidate 1", "Contain the correct name");
            assert.equal(candidate.voteCount, 0, "Contain the correct vote count");
            return electionInstance.candidates(2);
        }).then(function(candidate){
            assert.equal(candidate.id, 2, "Contain the correct is");
            assert.equal(candidate.name, "Candidate 2", "Contain the correct name");
            assert.equal(candidate.voteCount, 0, "Contain the correct vote count");
        })
    })
})