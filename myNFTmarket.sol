// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721Enumerable, Ownable {
    using Strings for uint256;

    // Base URI for metadata
    string private _baseTokenURI;

    constructor(string memory name, string memory symbol, string memory baseTokenURI) ERC721(name, symbol) {
        _baseTokenURI = baseTokenURI;
    }

    // Mint a new NFT
    function mint(address to) public onlyOwner {
        uint256 tokenId = totalSupply() + 1;
        _mint(to, tokenId);
    }

    // Override the base function to return the token URI
    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }

    // Update the base URI
    function setBaseURI(string memory newBaseTokenURI) public onlyOwner {
        _baseTokenURI = newBaseTokenURI;
    }
}
