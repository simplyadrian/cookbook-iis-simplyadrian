#
# Cookbook Name:: iis-nativex
# Recipe:: default
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe "iis"
include_recipe "iis-nativex::add-windows-feature"
include_recipe "iis-nativex::create-app-pool"
include_recipe "iis-nativex::create-config-sites"

windows_package 'MSDeploy x64 3.5' do
	source 'http://go.microsoft.com/fwlink/?LinkID=309497'
	action :install
end