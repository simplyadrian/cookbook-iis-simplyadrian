#
# Cookbook Name:: iis-nativex
# Recipe:: config-iis-handlers
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

# Loads an array handler settings from the node
cfg_cmds = node['iis-nativex']['cfg_cmd']
cfg_cmds.each do |cmd|
    iis_config "#{cmd}" do
        action :config
    end
end