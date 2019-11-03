pragma solidity >=0.4.21 <0.6.0;

const MyERC721 = artifacts.require("./MyERC721.sol");
module.exports = async function(deployer) {
  await deployer.deploy(MyERC721, "CAT1 Token", "CAT1")
  const erc721 = await MyERC721.deployed()
}

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  constructor() public {
    owner = msg.sender;
  }

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}
