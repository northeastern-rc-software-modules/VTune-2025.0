#!/bin/bash

# Setting up environmental variables for the installation
# Only SOFTWARE_DIRECTORY will need to be changed on future updates
# If a user wants to clone and install a local copy for themselves/groups
# CLUSTER_DIRECTORY needs to be modified

module load explorer/1.0

export CURRENT_PATH=/home/j.cooke/modules/vtune-2025.0
export CLUSTER_DIRECTORY=/shared/EL9/explorer
export SOFTWARE_NAME=VTune
export SOFTWARE_VERSION=2025.0

export GITHUB_URL=https://github.com/northeastern-rc-software-modules/VTune-2025.0
export SOFTWARE_DIRECTORY=$CLUSTER_DIRECTORY/$SOFTWARE_NAME/$SOFTWARE_VERSION
export PATH=$SOFTWARE_DIRECTORY/bin:$PATH
export LIBRARY_PATH=$SOFTWARE_DIRECTORY/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=$SOFTWARE_DIRECTORY/lib:$LD_LIBRARY_PATH
export CPATH=$SOFTWARE_DIRECTORY/include:$CPATH

