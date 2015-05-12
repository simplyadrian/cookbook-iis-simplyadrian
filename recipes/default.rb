#
# Cookbook Name:: iis-simplyadrian
# Recipe:: default
#
# Copyright 2015, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

windows_package 'Microsoft Web Deploy v3.5' do
	source "C:\\chef\\cache\\cookbooks\\iis-simplyadrian\\files\\default\\WebDeploy_amd64_en-US.msi"
	installer_type :msi
	action :install
end

include_recipe 'iis'
include_recipe 'iis-simplyadrian::add-windows-feature'
include_recipe 'iis-simplyadrian::create-app-pool'
include_recipe 'iis-simplyadrian::create-config-sites'
