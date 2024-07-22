// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {NextLevelNft} from "../src/NextLevelNft.sol";
contract MintNft is Script {

    string constant NLN = "https://ipfs.io/ipfs/QmQhe9s3LoFZ6Ca6Tb2u1b4rBu7tuCRN97NJn3G2E887TD?filename=NextLevel.json";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("NextLevelNft",block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
            //basiclly binding the id or say conter to the json uri
            NextLevelNft(contractAddress).mintNft(NLN);
        vm.stopBroadcast();
    }
}

