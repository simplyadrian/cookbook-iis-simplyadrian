#
# Cookbook Name:: iis-simplyadrian
# Recipe:: install-ARR-helper
#
# Copyright 2015, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

# install the ARR helper msi from file.
# Optimize to use a remote file rather then storing an msi in source code.

windows_package 'install ARR helper' do
	source "C:\\chef\\cache\\cookbooks\\iis-simplyadrian\\files\\default\\arr_helper_x64.msi"
	installer_type :msi
	action :install
end

# ARR Helper Schema is located at C:\Windows\System32\inetsrv\config\schema
# using the template resource we will update it with the correct values.

template 'ARR Helper Schema' do
  source 'arr_helper_schema.xml.erb'
  path "#{node['iis-simplyadrian']['schema_dir']}\\schema.xml"
  action :create
end