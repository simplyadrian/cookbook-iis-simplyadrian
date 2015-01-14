#
# Cookbook Name:: iis-nativex
# Recipe:: add-windows-features
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

node['iis_nativex']['features'].each do |feature|
  windows_feature feature do
    action :install
  end
end