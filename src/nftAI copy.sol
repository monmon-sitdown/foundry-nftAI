// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";

contract MyNFT is ERC721, ERC721Burnable {
    error BasicNft__TokenUriNotFound();

    event ContractDeployed();

    mapping(uint256 tokenId => string tokenUri) private s_tokenIdToUri;
    uint256 private s_tokenCounter;

    constructor() ERC721("MyNFT", "MNFT") {
        s_tokenCounter = 0;
        emit ContractDeployed();
    }

    function mint(address to, string memory tokenUri) external {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(to, s_tokenCounter);
        s_tokenCounter = s_tokenCounter + 1;
    }

    /*function tokenURI(uint256 tokenId) public view override returns (string memory) {
        if (ownerOf(tokenId) == address(0)) {
            revert BasicNft__TokenUriNotFound();
        }
        return s_tokenIdToUri[tokenId];
    }*/
}
