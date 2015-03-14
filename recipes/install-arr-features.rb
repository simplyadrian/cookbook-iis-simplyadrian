#
# Cookbook Name:: iis-nativex
# Recipe:: add-windows-features
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

# Stop IIS and and Web Management Service
node['iis-nativex']['services'].each do |srv|
  service srv[:services] do
  action :stop
  Chef::Log.log("Stopping IIS services before I install the ARR feature and dependencies")
end

# Install all ARR dependencies and ARR application
node['iis-nativex']['arr_application'].each do |win_pkg|
  windows_package win_pkg[:package_name] do
    source win_pkg[:source]
    installer_type win_pkg[:installer_type]
    checksum win_pkg[:checksum]
    options win_pkg[:options]
    timeout win_pkg[:timeout]
    version win_pkg[:version]
    action :install
    Chef::Log.log("Installing the ARR features and dependencies.")
  end
end

# Start IIS and and Web Management Service
node['iis-nativex']['services'].each do |srv|
  service srv[:service_name] do
  action :start
  Chef::Log.log("Restarting the IIS services.")
end