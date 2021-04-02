#!/bin/bash

# Install the dependencies...
sudo dpkg -i packages/*.deb
sudo apt --fix-broken install

echo "Dependency install complete."
