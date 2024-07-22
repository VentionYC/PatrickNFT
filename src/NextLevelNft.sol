// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
//Test commit
contract NextLevelNft is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;

    constructor() ERC721("NextLevelNft", "NLN") {
        s_tokenCounter = 0;
    }

    // let the people choose each their own token uri, or say how the toke looked like 
    function mintNft(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    //tokenid endpoint api return the metadata of the NFT
    function tokenURI(uint256 tokenId) public view override returns (string memory){
        return s_tokenIdToUri[tokenId];
    } 
    
}