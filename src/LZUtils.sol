// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import {JsonUtils} from "./json/json.sol";

abstract contract LZUtils is JsonUtils {
    function IS_WORKING() public pure returns (bool) {
        return true;
    }
}
