#
# Cookbook Name:: iis-simplyadrian
# Recipe:: config-iis-cmd
#
# Copyright 2015, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

# Loads an array handler settings from the node
cfg_cmds = node['iis-simplyadrian']['cfg_cmd']
cfg_cmds.each do |cmd|
    iis_config "#{cmd}" do
        action :config
    end
end