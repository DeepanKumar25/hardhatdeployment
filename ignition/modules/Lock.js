// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const royaltyPercentage = 200;

module.exports = buildModule("LockModule", (m) => {
  const royaltyPercent = m.getParameter("royalty", royaltyPercentage);

  const deployedContract = m.contract("AccessPass", [royaltyPercent],);
  console.log("Deployed contract: " + deployedContract);
  return { deployedContract };
});


//        url: `https://sepolia.infura.io/v3/${INFURA_API_KEY}`,
