// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import {JsonReader} from "./JsonReader.sol";
import {JsonWriter} from "./JsonWriter.sol";

abstract contract JsonUtils is JsonReader, JsonWriter {}
