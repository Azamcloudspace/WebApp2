#!/bin/bash

# Fetch the region from EC2 instance metadata
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
AZ=`curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/placement/availability-zone`
REGION="${AZ::-1}"  # Remove the last character to get the region

# Insert the region into index.html using placeholder
sed -i "s/{{REGION}}/$REGION/g" /var/www/html/index.html
