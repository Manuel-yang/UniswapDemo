const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('Test of UniswapDemo', () => {
  beforeEach(async () => {
    Token = await ethers.getContractFactory('Uniswap');
    token = await Token.deploy();
    [owner, addr1, addr2, _] = await ethers.getSigners();
  });

  describe("Pair", async () => {
    let usdtAddress = "0xdac17f958d2ee523a2206206994597c13d831ec7";
    let ethAddress = "0xc18360217d8f7ab5e7c516566761ea12ce7f9d72";

    it('返回一个交易对地址', async () => {
      let newPairAddress = await token.createPair(usdtAddress, ethAddress)
      console.log("交易对地址为: " + await newPairAddress);
    });
  })
})