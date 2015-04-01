#!/usr/bin/bash

# Provisioning script for Centos 6 on SoftLayer

# Get to a known spot
cd ~

# Come up to date
yum update

# Get our metadata
curl https://api.service.softlayer.com/rest/v3/SoftLayer_Resource_Metadata/getUserMetadata > /tmp/SetupMetadata

# Install chef
curl -L https://www.chef.io/chef/install.sh | bash
wget http://github.com/opscode/chef-repo/tarball/master
tar zxf master
mv chef-chef-repo-* chef-repo
mkdir .chef
echo  "cookbook_path [ '/root/chef-repo/cookbooks' ]" > .chef/knife.rb
