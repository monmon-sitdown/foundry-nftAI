// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNFT is ERC721 {
    uint256 public nextTokenId;
    mapping(uint256 id => string uri) private _tokenURIs;

    constructor() ERC721("MyNFT", "MNFT") {}

    function mint(address to, string memory tokenUri) external {
        _safeMint(to, nextTokenId);
        _tokenURIs[nextTokenId] = tokenUri;
        nextTokenId++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return _tokenURIs[tokenId];
    }
}
