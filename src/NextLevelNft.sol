// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NextLevelNft is ERC721 {
    constructor() ERC721("NextLevelNft", "NLN") {}
}