#!/bin/bash

# Get the region of the EC2 instance
REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F\" '{print $4}')

# Update the HTML file with the region
sed -i "s/Region: Loading.../Region: $REGION/" /var/www/html/index.html
