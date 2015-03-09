#
# Cookbook Name:: iis-nativex
# Recipe:: create-app-pool
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

node['iis-nativex']['enabled_pools'].each do |pool_cfg|
  iis_pool pool_cfg['pool_name'] do
    runtime_version pool_cfg['runtime_version']
    pipeline_mode pool_cfg['pipeline_mode']
    pool_username pool_cfg['pool_username']
    pool_password pool_cfg['pool_password']
    action :add
  end
   Chef::Log.info("The pool_username is ['iis-nativex']['pool_username'] and the pool_password is ['iis-nativex']['pool_password']")
end