// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract pharmX is ERC20 {
    mapping(uint256 => mapping(uint256 => string)) public proof;
    uint256 maxSupply = 1000000;
    uint256 mint_price = 0.0001 ether;
    mapping(uint256 =>uint256) prooflength;

    constructor() ERC20("pharmX", "PHX") {
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        return super.transfer(recipient, amount);
    }

    function mint(address to, uint256 amount) public payable {
        require(msg.value >= mint_price*amount,"Not enough eth sent");
        require(totalSupply() + amount <= maxSupply,"Cannot mint that many tokens");
        _mint(to, amount);
    }

    function uploadProof(uint256 orderId, string memory _proof) public 
    {

        proof[orderId][prooflength[orderId]++]= _proof;
    }

    function getIpfsHash(uint256 orderId) public view returns (string[] memory){
        string[] memory hash = new string[](prooflength[orderId]);

        for(uint256 i=0;i<prooflength[orderId];i++)
        hash[i]=(string(abi.encodePacked("ipfs.io/ipfs/", proof[orderId][i])));
         return hash;
    }
}
