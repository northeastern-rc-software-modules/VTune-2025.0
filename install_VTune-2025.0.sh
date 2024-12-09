#!/bin/bash
#SBATCH -N 1
#SBATCH -n 32
#SBATCH -p rc
#SBATCH -t 8:00:00

# Setting up the environment
source env_VTune-2025.0.sh

# Creating the src directory for the installed application
mkdir -p $SOFTWARE_DIRECTORY/src

# Installing $SOFTWARE_NAME/$SOFTWARE_VERSION
# Installing VTune 2025.0
cd $SOFTWARE_DIRECTORY/src
wget https://registrationcenter-download.intel.com/akdlm/IRC_NAS/e7797b12-ce87-4df0-aa09-df4a272fc5d9/intel-vtune-2025.0.0.1130_offline.sh
chmod 755 intel-vtune-2025.0.0.1130_offline.sh
./intel-vtune-2025.0.0.1130_offline.sh -a -c -s --install-dir $SOFTWARE_DIRECTORY --eula accept

# Creating modulefile
touch $SOFTWARE_VERSION
echo "#%Module" >> $SOFTWARE_VERSION
echo "module-whatis	 \"Loads $SOFTWARE_NAME/$SOFTWARE_VERSION module." >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "This module was built on $(date)" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "VTune (https://www.intel.com/content/www/us/en/developer/tools/oneapi/vtune-profiler.html#gs.ihe7xj) is a performance analysis suite." >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "The script used to build this module can be found here: $GITHUB_URL" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "To load the module, type:" >> $SOFTWARE_VERSION
echo "module load $SOFTWARE_NAME/$SOFTWARE_VERSION" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "\"" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "conflict	 $SOFTWARE_NAME" >> $SOFTWARE_VERSION
echo "prepend-path	 PATH $SOFTWARE_DIRECTORY/vtune/$SOFTWARE_VERSION/bin32" >> $SOFTWARE_VERSION
echo "prepend-path       PATH $SOFTWARE_DIRECTORY/vtune/$SOFTWARE_VERSION/bin64" >> $SOFTWARE_VERSION
echo "prepend-path       LD_LIBRARY_PATH $SOFTWARE_DIRECTORY/vtune/$SOFTWARE_VERSION/lib32" >> $SOFTWARE_VERSION
echo "prepend-path       LD_LIBRARY_PATH $SOFTWARE_DIRECTORY/vtune/$SOFTWARE_VERSION/lib64" >> $SOFTWARE_VERSION
echo "prepend-path       CPATH $SOFTWARE_DIRECTORY/vtune/$SOFTWARE_VERSION/include" >> $SOFTWARE_VERSION

# Moving modulefile
mkdir -p $CLUSTER_DIRECTORY/modulefiles/$SOFTWARE_NAME
cp $SOFTWARE_VERSION $CLUSTER_DIRECTORY/modulefiles/$SOFTWARE_NAME/$SOFTWARE_VERSION
cp $SOFTWARE_VERSION $CURRENT_PATH
