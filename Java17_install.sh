#Shell script for Java Installation


#!/bin/bash

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y wget

# Download Java 17
wget https://download.java.net/java/17/latest/jdk-17_linux-x64_bin.tar.gz

# Extract the downloaded archive
sudo tar -xzvf jdk-17_linux-x64_bin.tar.gz -C /opt

# Set up environment variables
sudo tee /etc/profile.d/java.sh <<EOF
export JAVA_HOME=/opt/jdk-17
export PATH=\$PATH:\$JAVA_HOME/bin
EOF

# Load the environment variables
source /etc/profile.d/java.sh

# Verify installation
java -version

#make script executable
chmod +x java17_install.sh

#Execute script
sudo ./java17_install.sh
