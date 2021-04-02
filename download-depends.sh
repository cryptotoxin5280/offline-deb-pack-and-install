#!/bin/bash
 
# Create a work directory
if [[ -f depends ]]; then
  rm -rf depends
fi

mkdir -p depends/packages

# Update the package index
sudo apt-get update -y

# Install Transport Mechanisms
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
 
# Clear the apt cache
sudo rm -rf /var/cache/apt/archives

# Download the packages with all their dependencies (MODIFY THIS LIST WITH YOUR OWN PACKAGES)
sudo apt-get install --reinstall --download-only -y adb
sudo apt-get install --reinstall --download-only -y iptables-persistent
sudo apt-get install --reinstall --download-only -y ethtool
sudo apt-get install --reinstall --download-only -y hugepages
sudo apt-get install --reinstall --download-only -y jq
sudo apt-get install --reinstall --download-only -y jsonlint
sudo apt-get install --reinstall --download-only -y libjq1
sudo apt-get install --reinstall --download-only -y libonig4
sudo apt-get install --reinstall --download-only -y netfilter-persistent
sudo apt-get install --reinstall --download-only -y net-tools
sudo apt-get install --reinstall --download-only -y openssh-server
sudo apt-get install --reinstall --download-only -y openssh-sftp-server
sudo apt-get install --reinstall --download-only -y php-cli
sudo apt-get install --reinstall --download-only -y php-common
sudo apt-get install --reinstall --download-only -y python3-pip

# Copy the packages to the work directory
sudo cp /var/cache/apt/archives/*.deb depends/packages/.

# Copy the installer to the work directory
cp install-depends.sh depends/.

# Zip up the work directory
tar -zcvf depends-`date +%F-%H%M`.tar.gz depends

# Unzip the file on the target and run depends/install-depends.sh
