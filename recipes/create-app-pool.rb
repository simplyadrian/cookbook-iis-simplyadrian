#
# Cookbook Name:: iis-nativex
# Recipe:: create-app-pool
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

#creates a new app pool
node['iis_naitivex']['pool_name'].each do |pool_name|
  iis_pool pool_name do
    runtime_version node['iis_nativex']['runtime_version']
    pipeline_mode node['iis_nativex']['pipeline_mode']
    action :add
  end
end