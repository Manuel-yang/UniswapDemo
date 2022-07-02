// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.16;

import "./UniswapV2Factory.sol";
import "./UniswapV2Pair.sol";
contract Uniswap {
    address internal constant UNISWAP_FACTORY_ADDRESS = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    // address internal constant UNISWAP_PAIR_ADDRESS = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    // address usdtAddress = 0xdac17f958d2ee523a2206206994597c13d831ec7;
    // address ethAddress = 0xc18360217d8f7ab5e7c516566761ea12ce7f9d72;
    address[] pairAddressList;

    IUniswapV2Factory private _factory = IUniswapV2Factory(UNISWAP_FACTORY_ADDRESS);
    IUniswapV2Pair private _pair;


    function createPair(address _token1, address _token2) payable public returns(address) {
        address newPairAddress =  _factory.createPair(_token1, _token2);
        pairAddressList.push(newPairAddress);
        return newPairAddress;
    }

    function getPair(address _token1, address _token2) view public returns(address) {
        return _factory.getPair(_token1, _token2);
    }

    function allPairsLength() public view returns (uint) {
        return _factory.allPairsLength();
    }

    function allPairs(uint _index) external view returns (address) {
        return _factory.allPairs(_index);
    }

    function skim(address _to) external {
        for (uint i = 0; i < pairAddressList.length; i++) {
            _pair = IUniswapV2Pair(pairAddressList[i]);
            _pair.skim(_to);
        }
        // _pair = IUniswapV2Pair()
        // _factory.getPair(_token1, _token2).skim(_to);
    }
}