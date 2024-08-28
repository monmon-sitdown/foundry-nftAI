// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Script.sol";
import "../src/nftAI.sol";

contract DeployMyNFT is Script {
    function run() external {
        vm.startBroadcast(); //deployerPrivateKey);

        // 部署合约
        MyNFT myNFT = new MyNFT(); // 或者提供实际的初始所有者地址
        console.log("MyNFT deployed to:", address(myNFT));

        vm.stopBroadcast();
    }
}

/**
 * MyNFT deployed to: 0x3aCcE8b5bf4AEc10C98f5618d8f7342ABD39E66f
 */
