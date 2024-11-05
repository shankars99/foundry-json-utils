// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import {JsonBase, console, stdJson} from "./Base.sol";

using stdJson for string;

abstract contract JsonReader is JsonBase {
    function getChainName(string memory _chain) internal view returns (string memory name) {
        name = getJson(_chain).readString(".name");
    }

    function getChainId(string memory _chain) internal view returns (uint256 chainId) {
        chainId = getJson(_chain).readUint(".chainId");
    }

    function getRpcUrl(string memory _chain) internal view returns (string memory rpc_url) {
        rpc_url = getJson(_chain).readString(".rpc_url");
    }

    function getEid(string memory _chain) internal view returns (uint32 eid) {
        eid = uint32(getJson(_chain).readUint(".eid"));
    }

    function getAddressLZ(string memory _chain, string memory _contractName)
        internal
        view
        returns (address lz_address)
    {
        string memory json = getJson(_chain);
        string memory protocol_contract_path = string.concat(".addresses.LAYERZERO.", _contractName);

        lz_address = json.readAddress(protocol_contract_path);
    }

    function getAddressProtocol(string memory _chain, string memory _protocol, string memory _contractName)
        internal
        view
        returns (address protocol_address)
    {
        string memory json = getJson(_chain);
        string memory protocol_contract_path = string.concat(".addresses.", _protocol, ".", _contractName);

        protocol_address = json.readAddress(protocol_contract_path);
    }

    function getAddressOAPP(string memory _chain, string memory _protocol, string memory _contractName)
        internal
        view
        returns (address protocol_address)
    {
        string memory json = getJson(_chain);
        string memory protocol_contract_path = string.concat(".addresses.", _protocol, ".OAPP_", _contractName);

        protocol_address = json.readAddress(protocol_contract_path);
    }

    function getAccount(string memory _chain, string memory _accountName) internal view returns (address account) {
        string memory json = getJson(_chain);
        string memory account_path = string.concat(".accounts.", _accountName);

        account = json.readAddress(account_path);
    }
}
