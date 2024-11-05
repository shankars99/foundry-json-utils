// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import {Script, console, stdJson} from "forge-std/Script.sol";

contract ExecutorBase is Script {
    uint8 constant PACKET_VERSION = 1;

    uint64 NONCE;

    uint32 EID_SRC;
    uint32 EID_DST;

    address OAPP_SRC;
    address OAPP_DST;

    address ENDPOINT_SRC;
    address ENDPOINT_DST;

    address RECVULN302_DST;
    
    string CHAIN_SRC;
    string CHAIN_DST;

    bytes MESSAGE;
}
