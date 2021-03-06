#
# Cookbook Name:: iis-simplyadrian
# Recipe:: add-windows-features
#
# Copyright 2015, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

# Stop IIS and and Web Management Service
node['iis-simplyadrian']['services'].each do |srv|
  service srv[:service_name] do
  action :stop
  end
end

# Install all ARR dependencies and ARR application
node['iis-simplyadrian']['arr_application'].each do |win_pkg|
  windows_package win_pkg[:package_name] do
    source win_pkg[:source]
    installer_type win_pkg[:installer_type]
    checksum win_pkg[:checksum]
    options win_pkg[:options]
    timeout win_pkg[:timeout]
    version win_pkg[:version]
    action :install
  end
end

# Start IIS and and Web Management Service
node['iis-simplyadrian']['services'].each do |srv|
  service srv[:service_name] do
  action :start
  end
end