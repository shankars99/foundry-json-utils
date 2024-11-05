// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import {Script, console, stdJson} from "forge-std/Script.sol";

contract JsonBase is Script {
    string internal root = vm.projectRoot();
    string internal broadcast_path = string.concat(root, "/broadcast/");
    string internal config_path = string.concat(root, "/config/");

    function getJson(string memory _path) public view returns (string memory json) {
        string memory path = string.concat(config_path, _path, ".json");
        json = vm.readFile(path);
    }
}
