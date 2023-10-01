pragma solidity >=0.8.0;

contract VotingSystem {

    // Private state variables
    address private owner;
    mapping(address => bool) private registeredVoters;
    mapping(address => uint256) private votes;

    // Constructor
    constructor() {
        owner = msg.sender;
    }

    // Modifier to check if a voter is registered
    modifier onlyVoter() {
        require(registeredVoters[msg.sender], "Only registered voters can vote");
        _;
    }

    // Function for the contract owner to register new voters
    function registerVoter(address voter) public onlyOwner {
        registeredVoters[voter] = true;
    }

    // Function for registered voters to cast their votes
    function vote(uint256 candidateId) public onlyVoter {
        votes[candidateId]++;
    }

    // Function to retrieve the current vote count
    function getVoteCount(uint256 candidateId) public view returns (uint256) {
        return votes[candidateId];
    }

    // Fallback function
    fallback() external payable {}
}
