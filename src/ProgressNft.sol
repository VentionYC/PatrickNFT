// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract ProgressNft is ERC721 {
    uint256 private s_tokenCounter;
    string private s_trackingSvg;
    string private s_hitSvg;
    string private s_hitHitSvg;

    //we need to bring in the svg file
    constructor(string memory trackingSvg,
                string memory hitSvg,
                string memory hitHitSvg) ERC721("Progress NFT", "PN"){
        s_tokenCounter = 0;
        s_trackingSvg = trackingSvg;
        s_hitSvg = hitSvg;
        s_hitHitSvg = hitHitSvg;
    }

    function mintNft()
}