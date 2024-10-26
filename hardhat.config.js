require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.27",
    networks: {
      sepolia: {
        url: `https://sepolia.infura.io/v3/baf1090874e04a06ae774570ca2c3593`,
        accounts: ["3d8b3e6a151eaf174418cb99516d3bdfd42e91f694e8ae285afc51132c0cf786"],
      },
      eth:{
        url:`https://mainnet.infura.io/v3/baf1090874e04a06ae774570ca2c3593`,
        accounts:["3d8b3e6a151eaf174418cb99516d3bdfd42e91f694e8ae285afc51132c0cf786"],
      }
    },
};

