#
# Cookbook Name:: iis-nativex
# Recipe:: default
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "WebDeploy_amd64_en-US.msi" do
  path "C:\\chef\\"
  source "WebDeploy_amd64_en-US.msi"
  action :create_if_missing
end

windows_package 'Web Deploy v3.5' do
	package_name 'Web Deploy v3.5'
	source "C:\\chef\\WebDeploy_amd64_en-US.msi"
	installer_type :msi
	action :install
end

include_recipe "iis"
include_recipe "iis-nativex::add-windows-feature"
include_recipe "iis-nativex::create-app-pool"
include_recipe "iis-nativex::create-config-sites"