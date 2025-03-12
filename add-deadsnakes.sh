#!/bin/bash

# Exit on error
set -e
echo "Updating and Upgrading First"
sudo apt update 
sudo apt upgrade || true

echo "Adding deadsnakes PPA..."
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update

echo "Installing Python 3.12..."
sudo apt install -y python3.12 python3.12-venv python3.12-dev

echo "Removing other Python versions..."
sudo apt remove -y python3.8 python3.9 python3.10 python3.11 || true
sudo apt autoremove -y

echo "Setting Python 3.12 as default python3..."
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 1
sudo update-alternatives --config python3

echo "Downloading get-pip.py..."
wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py

echo "Installing pip for Python 3.12..."
python3.12 /tmp/get-pip.py

echo "Cleaning up..."
rm /tmp/get-pip.py
sudo apt autoremove -y
sudo apt clean

echo "Python 3.12 and pip installation complete!"
python3 --version
pip --version
