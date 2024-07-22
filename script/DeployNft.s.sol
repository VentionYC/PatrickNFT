// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
import {Script} from "forge-std/Script.sol";
import {NextLevelNft} from "../src/NextLevelNft.sol";
contract DeployNextLevelNft is Script {

    function run() external returns (NextLevelNft) {
        vm.startBroadcast();
            NextLevelNft nln = new NextLevelNft();
        vm.stopBroadcast();
        return nln;
    }
    
}