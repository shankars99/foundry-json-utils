This repository contains 3 packages that aim to create foundry forked net testing, scripting, and json r/w easier.

```bash
forge install https://github.com/shankars99/lz-foundry-utils.git --shallow
```

```solidity
import {LZUtils} from "@lz-foundry-utils/LZUtils.sol";

contract MyContract is LZUtils {
    // your contract now has access to all the utilities provided by LZUtils
}
```

1. [**json**](src/json/): Contains R/W support for `.json` files defined by the example schema in [`ETHEREUM.json`](config/ETHEREUM.json)".
   - root keys are lower-cased, and "variables" are capitalized.
   - `JsonUtils` contains scripts to quick-read `chainName`, `chainId`, `rpcUrl`, `eid`, `addresses`, and `accounts` from the json file.
   - To make reading addresses easier, it is split into `LAYERZERO`, `OAPP`, and `PROTOCOL`, each having helper functions to read the addresses.
   - Writing is also supported