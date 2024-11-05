// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import {JsonBase, console, stdJson} from "./JsonBase.sol";

using stdJson for string;

abstract contract JsonWriter is JsonBase {
    function writeDeployedAddress(
        string memory _chain,
        string calldata _protocol,
        string calldata _contractName,
        address _address
    ) public {
        vm.writeJson(vm.toString(_address), getJson(_chain), string.concat(".", _protocol, ".", _contractName));

        console.log("Deployed address %s is written to %s", _address, _contractName);
    }
}
