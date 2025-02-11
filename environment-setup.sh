#!/bin/bash

# Script must run with sudo permissions

# get updated package lists
apt-get update
# upgrade existing packages
apt-get upgrade -y
# grab Visual Studio Code .deb binary
wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
# resulting download is a valid .deb binary, but must be renamed for 
# recognition by apt
mv 'download?build=stable&os=linux-deb-x64' vscode.deb
# install freshly renamed deb file
apt-get install ./vscode.deb

# verify vs code was successfully installed to the system
vs_code_version=$(code --version)
if [[ $vs_code_version == *"not found"* ]]; then
  echo "Visual Studio Code install failed"
  exit 1
fi
# use Visual Studio Code's provided commands to install
# requisite extensions
#WIP


exit 0
