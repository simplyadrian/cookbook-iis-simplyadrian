#
# Cookbook Name:: iis-simplyadrian
# Recipe:: create-app-pool
#
# Copyright 2015, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

node['iis-simplyadrian']['enabled_pools'].each do |pool_cfg|
  iis_pool pool_cfg['pool_name'] do
    runtime_version pool_cfg['runtime_version']
    pipeline_mode pool_cfg['pipeline_mode']
    pool_username pool_cfg['pool_username']
    pool_password pool_cfg['pool_password']
    action [:add, :config, :start]
    not_if 
  end
end