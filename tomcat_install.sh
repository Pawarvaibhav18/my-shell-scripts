#Script for tomcat installation


#!/bin/bash

# Update package list
sudo apt update

# Install Java (assuming Java 17 is already installed)
sudo apt install -y default-jdk

# Create a dedicated Tomcat user
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

# Download Tomcat (adjust the version number as needed)
wget https://downloads.apache.org/tomcat/tomcat-10/v10.0.12/bin/apache-tomcat-10.0.12.tar.gz

# Create the Tomcat installation directory
sudo mkdir /opt/tomcat

# Extract the downloaded archive
sudo tar -xzvf apache-tomcat-10.0.12.tar.gz -C /opt/tomcat --strip-components=1

# Update the permissions
sudo chown -R tomcat:tomcat /opt/tomcat
sudo chmod +x /opt/tomcat/bin/*.sh

# Create a systemd service file for Tomcat
sudo tee /etc/systemd/system/tomcat.service <<EOF
[Unit]
Description=Apache Tomcat
After=network.target

[Service]
Type=forking
User=tomcat
Group=tomcat
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd daemon
sudo systemctl daemon-reload

# Start Tomcat service
sudo systemctl start tomcat

# Enable Tomcat service to start on boot
sudo systemctl enable tomcat

# Display Tomcat status
sudo systemctl status tomcat

# Make script executable
chmod +x tomcat_install.sh


#Execute the script
sudo ./tomcat_install.sh

