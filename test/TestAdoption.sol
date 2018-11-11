pragma solidity ^0.4.17;
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/adoption.sol";

contract TestAdoption {

    Adoption adoption = Adoption(DeployedAddresses.Adoption());
    uint expectedId = 8;
    address expectedAddress = this;

    function testUserCanAdopt() public{
        uint returnId = adoption.adopt(expectedId);
        Assert.equal(returnId, expectedId, "match occures");
    }

    // Testing retrieval of a single pet's owner
    function testGetAdopterAddressByPetId() public {
        address adopter = adoption.adopters(expectedId);

        Assert.equal(adopter, expectedAddress, "Owner of the expected pet should be this contract");
    }

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public {
        // Store adopters in memory rather than contract's storage
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[expectedId], expectedAddress, "Owner of the expected pet should be this contract");
    }
}