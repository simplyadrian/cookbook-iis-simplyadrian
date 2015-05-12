#
# Cookbook Name:: iis-simplyadrian
# Recipe:: add-windows-features
#
# Copyright 2015, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

node['iis-simplyadrian']['features'].each do |feature|
  windows_feature feature do
    action :install
  end
end