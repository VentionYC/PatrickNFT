// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
import {Test} from "forge-std/Test.sol";
import {DeployNextLevelNft} from "../script/DeployNft.s.sol";
import {NextLevelNft} from "../src/NextLevelNft.sol";

contract NextLevelNftTest is Test {

    //some local via for the delopyer and the nft instance
    DeployNextLevelNft public deployer;
    NextLevelNft public nln;
    address public USER = makeAddr("user");
    string constant NLN = "https://ipfs.io/ipfs/QmQhe9s3LoFZ6Ca6Tb2u1b4rBu7tuCRN97NJn3G2E887TD?filename=NextLevel.json";


    function setUp() public {
        deployer = new DeployNextLevelNft();
        nln = deployer.run();
    }

    function testTheNameIsCorrect() public view {
        string memory expectedName = "NextLevelNft";
        string memory actualName = nln.name();
        //the abi encoded string of the both expected name and the actual name
        //conver the string to dynamic bytes
        assert(keccak256(abi.encodePacked(expectedName)) == 
        keccak256(abi.encodePacked(actualName)));

    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER); 
        nln.mintNft(NLN);
        assert(nln.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(nln.tokenURI(0))) 
        == keccak256(abi.encodePacked(NLN)));

    }
}