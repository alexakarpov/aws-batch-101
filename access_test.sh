#!/bin/bash
#This is simple bash script that is used to test access to the EC2 Parameter store.
# Install the AWS CLI
apt-get -y install python2.7 curl
curl -O https://bootstrap.pypa.io/get-pip.py
python2.7 get-pip.py
pip install awscli
# Getting region
EC2_AVAIL_ZONE=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone`
EC2_REGION="`echo \"$EC2_AVAIL_ZONE\" | sed -e 's:\([0-9][0-9]*\)[a-z]*\$:\\1:'`"
# Trying to retrieve parameters from the EC2 Parameter Store
APP1_WITH_ENCRYPTION=`aws ssm get-parameters --names prod.app1.db-pass --with-decryption --region $EC2_REGION --output text 2>&1`
APP1_WITHOUT_ENCRYPTION=`aws ssm get-parameters --names prod.app1.db-pass --no-with-decryption --region $EC2_REGION --output text 2>&1`
LICENSE_WITH_ENCRYPTION=`aws ssm get-parameters --names general.license-code --with-decryption --region $EC2_REGION --output text 2>&1`
LICENSE_WITHOUT_ENCRYPTION=`aws ssm get-parameters --names general.license-code --no-with-decryption --region $EC2_REGION --output text 2>&1`
APP2_WITHOUT_ENCRYPTION=`aws ssm get-parameters --names prod.app2.user-name --no-with-decryption --region $EC2_REGION --output text 2>&1`
# The nginx server is started after the script is invoked, preparing folder for HTML.
if [ ! -d /usr/share/nginx/html/ ]; then
mkdir -p /usr/share/nginx/html/;
fi
chmod 755 /usr/share/nginx/html/
