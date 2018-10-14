#!/bin/sh
# ==============================================================================
# Runs a suite of smart contract security tools
#
# 1. Ensure execute permissions are set using:
#      chmod +x sweep.sh
# 2. Run script passing contract path as an input
#      ./sweep.sh path/to/Contract.sol
# ==============================================================================

# Get contract to run
contractName=$1

# Create outputs directory if it does not exist
if [ ! -d outputs ]; then
  mkdir ./outputs
fi

# Run Mythril, pipe output to mythril.out
docker container run -v $(pwd)/contracts:/contracts mythril/myth -x \
  /${contractName} > outputs/mythril.out
