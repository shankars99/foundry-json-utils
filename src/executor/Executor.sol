// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {ExecutorBase, console} from "./Base.sol";

import {ILayerZeroEndpointV2, Origin} from "@lzEvmV2/protocol/contracts/interfaces/ILayerZeroEndpointV2.sol";

import {JsonUtils} from "@/json/utils.sol";

contract Executor is ExecutorBase, JsonUtils {
//     function setUp() public {

//         EID_SRC = jsonUtils.get_eid("SRC");
//         OAPP_SRC = jsonUtils.get_deployed_address("OAPP_SRC");
//         OAPP_DST = jsonUtils.get_deployed_address("OAPP_DST");
//         EID_DST = jsonUtils.get_eid("DST");

//         ENDPOINT_SRC = getAddressLZ("","ENDPOINT_V2");
//         ENDPOINT_DST = getAddressLZ("","ENDPOINT_V2");

//         vm.label(ENDPOINT_DST, "ENDPOINT_DST");
//     }

//     function run(uint64 _nonce, string calldata _srcChain, string calldata _dstChain) public {
//         NONCE = _nonce;
//         CHAIN_SRC = _srcChain;
//         CHAIN_DST = _dstChain;

//         vm.startBroadcast();
//         _lzReceiveTrigger(message);
//         vm.stopBroadcast();
//     }

//     function _lzReceiveTrigger(string memory _message) internal {
//         Origin memory origin = Origin(EID_SRC, lzUtils.toBytes32(OAPP_SRC), NONCE);
//         bytes32 guid = _getGuid();
//         bytes memory message = abi.encode(_message);
//         bytes memory extraData = "";

//         ILayerZeroEndpointV2(ENDPOINT_DST).lzReceive(origin, address(OAPP_DST), guid, message, extraData);
//     }

//     function _getGuid() internal view returns (bytes32 guid) {
//         guid = lzUtils.generate_guid(NONCE, EID_SRC, OAPP_SRC, EID_DST, OAPP_DST);
//     }
}
