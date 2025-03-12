#!/bin/bash

# Exit on error
set -e

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing required dependencies..."
sudo apt install -y software-properties-common curl wget gnupg

echo "Adding repositories for Metasploit..."
curl https://raw.githubusercontent.com/rapid7/metasploit-framework/master/msfupdate | bash

echo "Installing cybersecurity tools..."
sudo apt install -y \
    nmap \
    wireshark \
    john \
    hydra \
    sqlmap \
    aircrack-ng \
    nikto \
    tor proxychains \
    netcat-traditional

echo "Setting up Metasploit..."
sudo msfdb init

echo "Configuring Proxychains for Tor..."
sudo sed -i 's/^#socks4/socks5/' /etc/proxychains.conf

echo "Installation complete! ✅"

echo "Installed Versions:"
echo "Metasploit: $(msfconsole --version | head -n 1)"
echo "Nmap: $(nmap --version | head -n 1)"
echo "Wireshark: $(wireshark --version | head -n 1)"
echo "John the Ripper: $(john --version | head -n 1)"
echo "Hydra: $(hydra --version | head -n 1)"
echo "Sqlmap: $(sqlmap --version | head -n 1)"
echo "Aircrack-ng: $(aircrack-ng --help | head -n 1)"
echo "Nikto: $(nikto -Version | head -n 1)"
echo "Tor: $(tor --version | head -n 1)"
