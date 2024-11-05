// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {LZUtils} from "@/LZUtils.sol";

contract CounterTest is Test, LZUtils {
    string constant chainName = "ETHEREUM";
    uint256 constant chainId = 1;
    string constant rpc_url = "https://mainnet.infura.io/v3/b9794ad1ddf84dfb8c34d6bb5dca2001";
    uint256 constant eid = 301011;

    address constant LZ_ENDPOINT_V2 = 0x1a44076050125825900e736c501f859c50fE728c;
    address constant OAPP_OFT_ADAPTER = 0x0000000000000000000000000000000000000000;
    address constant PROTOCOL_ERC20 = 0x643C4E15d7d62Ad0aBeC4a9BD4b001aA3Ef52d66;

    address constant sender = 0x36e83766531BA57a30373EFF061186619CA46FA1;
    address constant account_1 = 0x24663A690432eaFdC07b1f9713F6Ec33B5F54475;

    function setUp() public {}

    function test_getChainName() public view {
        assertEq(chainName, getChainName(chainName));
    }

    function test_getChainId() public view {
        assertEq(chainId, getChainId(chainName));
    }

    function test_getRpcUrl() public view {
        assertEq(rpc_url, getRpcUrl(chainName));
    }

    function test_getEid() public view {
        assertEq(eid, getEid(chainName));
    }

    function test_getLzEndpointV2() public view {
        assertEq(LZ_ENDPOINT_V2, getAddressLZ(chainName, "ENDPOINT_V2"));
    }

    function test_OAPP() public view {
        assertEq(OAPP_OFT_ADAPTER, getAddressOAPP(chainName, "OFT_ADAPTER"));
    }

    function test_getProtocolERC20() public view {
        assertEq(PROTOCOL_ERC20, getAddressProtocol(chainName, "ERC20"));
    }

    function test_getAccount() public view {
        assertEq(sender, getAccount(chainName, "SENDER"));
    }

    function test_getAccount2() public view {
        assertEq(account_1, getAccount(chainName, "ACCOUNT_1"));
    }
}
