#
# Cookbook Name:: iis-nativex
# Recipe:: create-config-sites
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

Chef::Resource::IisSite.send(:include, IisNativex::Helper)

# stop and delete the default site
iis_site 'Default Web Site' do
  action [:stop, :delete]
end

#create physical locations
node['iis-nativex']['enabled_sites'].each do |mkdir|
  directory "#{node['iis']['docroot']}/#{mkdir['site_name']}" do
    recursive true
    action :create
  end
end

# create and start a new site that maps to
# the physical location C:\inetpub\wwwroot\#{site_name}
node['iis-nativex']['enabled_sites'].each do |site_cfg|
  iis_site site_cfg[:site_name] do
    protocol site_cfg[:protocol]
    port site_cfg[:port]
    path site_cfg[:path]
    application_pool site_cfg[:pool_name]
    action [:add, :config]
  end
  iis_site site_cfg[:site_name] do
    bindings get_bindings_string( site_cfg )
    action [:config]
  end
end