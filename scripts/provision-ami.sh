#!/usr/bin/env bash

# Update and install dependencies.
apt-get update -y
apt-get install -y zip

# Download AWS CLI to copy the Unreal Engine dedicated server from S3.
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/usr/bin/awscliv2.zip"
unzip /usr/bin/awscliv2.zip -d /usr/bin/
bash /usr/bin/aws/install

# Use the AWS CLI to copy the Unreal Engine dedicated server from S3.
echo "Copying dedicated server from ${DEDICATED_SERVER_BUCKET}."
aws s3 cp s3://${DEDICATED_SERVER_BUCKET}/dedicated-server.tar.gz /tmp/

# Unzip the dedicated server and move from the tmp directory to /usr/bin/dedicated-server.
mkdir -p /usr/bin/dedicated-server/
tar -xzf /tmp/dedicated-server.tar.gz -C /usr/bin/dedicated-server/

# Add a new unreal user. This user will be used to start the Unreal Engine dedicated server process.
useradd unreal

# Change the owner of the dedicated-server directory to unreal.
chown -R unreal:unreal /usr/bin/dedicated-server/
rm /tmp/dedicated-server.tar.gz

# Enable the dedicated-server service so that the Unreal Engine dedicated server process starts on boot.
systemctl enable dedicated-server.service
