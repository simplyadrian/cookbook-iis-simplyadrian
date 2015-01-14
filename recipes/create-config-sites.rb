#
# Cookbook Name:: iis-nativex
# Recipe:: create-config-sites
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

# stop and delete the default site
iis_site 'Default Web Site' do
  action [:stop, :delete]
end

# create and start a new site that maps to
# the physical location C:\inetpub\wwwroot\#{site_name}
node['iis_nativex']['site_name'].each do |site_name|
  iis_site site_name do
    protocol :http
    port 80
    path "C:\\inetpub\\wwwroot\\#{site_name}"
    host_header "#{site_name}"
    application_pool "#{node['iis_nativex']['pool_name']}"
    action [:add,:start]
  end
end

#create physical locations
node['iis_nativex']['site_name'].each do |mkdir|
  directory "C:\\inetpub\\wwwroot\\#{mkdir}" do
    #rights :read, 'MORDOR\Minions'
    #rights :full_control, 'MORDOR\Sauron'
    action :create
  end
end