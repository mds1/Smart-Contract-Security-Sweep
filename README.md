# Smart Contract Security Sweep
This program runs a contract through a range of available smart contract security tools. Output files for each tool are placed in the `outputs` directory in files called `toolName.out`. Currently, the following tools have been implemented:

* Mythril

## Getting Started

### Prerequisites

Docker and Bash are required to use this tool.

### Using This Tool

1. Pull Mythril using `docker pull mythril/myth`
2. Execute the script using `./sweep.sh ContractName.sol`
3. Outputs will be placed in a folder called `outputs`

## Tools
### Mythril
Smart contract analysis tool using concolic analysis, taint analysis and control flow checking

[Source](https://github.com/ConsenSys/mythril/wiki/With-Docker)


### Manticore
Symbolic Execution Tool

[Source](https://github.com/trailofbits/manticore)

### Echidna
Fuzz Testing Framework

[Source](https://github.com/trailofbits/echidna)

### Slither
Solidity Static Analyzer

[Source](https://github.com/trailofbits/slither)

### Ethersplay
EVM Disassembler

[Source](https://github.com/trailofbits/ethersplay)

### Oyente
Smart Contract Analysis Tool

[Source](https://github.com/melonproject/oyente)

### Securify
Smart Contract Security Scanner

[Source](https://github.com/eth-sri/securify)

## Useful Links
* https://consensys.github.io/smart-contract-best-practices/security_tools/
* https://github.com/trailofbits/awesome-ethereum-security