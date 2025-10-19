require("dotenv").config();
require("@nomiclabs/hardhat-ethers");

const MUMBAI_RPC = process.env.MUMBAI_RPC || "";
const PRIVATE_KEY = process.env.PRIVATE_KEY || "";

module.exports = {
  solidity: "0.8.20",
  networks: {
    hardhat: {},
    mumbai: {
      url: MUMBAI_RPC,
      accounts: PRIVATE_KEY ? [PRIVATE_KEY] : []
    }
  }
};
