// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import {JsonUtils} from "./json/utils.sol";
import {ExecutorUtils} from "./executor/utils.sol";
import {DVNUtils} from "./dvn/utils.sol";

abstract contract LZUtils is JsonUtils, ExecutorUtils, DVNUtils {
    function IS_WORKING() public pure returns (bool) {
        return true;
    }
}
