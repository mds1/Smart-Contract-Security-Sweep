#!/bin/sh
# ==============================================================================
# Runs a suite of smart contract security tools
#
# 1. Ensure execute permissions are set using:
#      chmod +x sweep.sh
# 2. Run script passing contract path as an input
#      ./sweep.sh path/to/Contract.sol
# ==============================================================================


# Setup ------------------------------------------------------------------------
# Get and start docker images
docker-compose up

# Get contract to run
contractName=$1

# Create outputs directory if it does not exist
if [ ! -d outputs ]; then
  mkdir ./outputs
fi


# Run tools --------------------------------------------------------------------
# Run Mythril, pipe output to mythril.out
docker container run -v $(pwd)/contracts:/contracts mythril/myth -x \
  /${contractName} > outputs/mythril.out

# Run Slither, pipe output to slither.out
docker container run -v $(pwd)/contracts:/contracts trailofbits/slither \
  /${contractName} > outputs/slither.out 2>&1

# Run Oyente, pipe output to oyente.out
oyenteCommand="cd oyente && python oyente.py -s contracts/${contractName} > outputs/oyente.out 2>&1"

docker container run -v $(pwd)/contracts:/oyente/oyente/contracts \
  -v $(pwd)/outputs:/oyente/oyente/outputs luongnguyen/oyente \
  /bin/bash -c ${oyenteCommand}


# Tear down --------------------------------------------------------------------
# Shut down Docker environments
docker-compose down
