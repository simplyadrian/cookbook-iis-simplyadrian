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

windows_package 'Web Deploy v3.5' do
	package_name 'Web Deploy v3.5'
	source "https://s3.amazonaws.com/installers-thirdparty-nativex/WebDeploy_amd64_en-US.msi"
	installer_type :msi
	options 'ADDLOCAL=ALL, /quiet -Wait'
	action :install
end