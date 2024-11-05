// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {ExecutorBase, console} from "./Base.sol";

import {ILayerZeroEndpointV2, Origin} from "@lzEvmV2/protocol/contracts/interfaces/ILayerZeroEndpointV2.sol";
import {AddressCast} from "@lzEvmV2/protocol/contracts/libs/AddressCast.sol";
import {GUID} from "@lzEvmV2/protocol/contracts/libs/GUID.sol";
import {PacketV1Codec} from "@lzEvmV2/protocol/contracts/messagelib/libs/PacketV1Codec.sol";

import {Packet} from "@lzEvmV2/protocol/contracts/interfaces/ISendLib.sol";

import {IReceiveUlnE2} from "@lzEvmV2/messagelib/contracts/uln/interfaces/IReceiveUlnE2.sol";

import {JsonUtils} from "@/json/utils.sol";

using AddressCast for address;
using PacketV1Codec for Packet;
abstract contract Sealer is ExecutorBase, JsonUtils {
    function execute(uint64 _nonce, string calldata _srcChain, string calldata _dstChain, bytes memory _message)
        public
    {
        initialize(_nonce, _srcChain, _dstChain, _message);

        vm.startBroadcast();
        _commitVerification();
        vm.stopBroadcast();
    }

    function initialize(uint64 _nonce, string calldata _srcChain, string calldata _dstChain, bytes memory _message) public {
        NONCE = _nonce;
        MESSAGE = _message;

        CHAIN_SRC = _srcChain;
        CHAIN_DST = _dstChain;

        EID_SRC = getEid(CHAIN_SRC);
        EID_DST = getEid(CHAIN_DST);

        OAPP_SRC = getAddressOAPP(CHAIN_SRC, "OAPP_SRC");
        OAPP_DST = getAddressOAPP(CHAIN_SRC, "OAPP_SRC");

        ENDPOINT_SRC = getAddressLZ(CHAIN_SRC, "ENDPOINT_V2");
        ENDPOINT_DST = getAddressLZ(CHAIN_DST, "ENDPOINT_V2");
        RECVULN302_DST = getAddressLZ(CHAIN_DST, "RECVULN302");

        vm.label(ENDPOINT_DST, "ENDPOINT_DST");
    }

    function _commitVerification() internal {
        Packet memory packet = Packet(
            PACKET_VERSION,
            NONCE,
            EID_SRC,
            OAPP_SRC.toBytes32(),
            EID_DST,
            OAPP_DST.toBytes32(),
            _getGuid(),
            MESSAGE
        );

        bytes memory packetHeader = packet.header();
        bytes32 payloadHash = Packet.payloadHash();

        IReceiveUlnE2(RECVULN302_DST).commitVerification(packetHeader, payloadHash);
    }

    function _getGuid() internal view returns (bytes32 guid) {
        guid = GUID.generate(NONCE, EID_SRC, OAPP_SRC, EID_DST, OAPP_DST);
    }
}
