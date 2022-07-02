/**
 * @type import('hardhat/config').HardhatUserConfig
 */
require("@nomiclabs/hardhat-waffle");
module.exports = {
  solidity: "0.5.16",
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545/",
      // accounts: [`0x${PRIVATE_KEY}`]
    }
  }
};
