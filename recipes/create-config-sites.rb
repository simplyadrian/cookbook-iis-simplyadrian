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
  iis_site site_cfg['site_name'] do
    #bindings "#{site_cfg['protocol']/*['port']['host_header']}"
    protocol site_cfg['protocol']
    port site_cfg['port']
    path site_cfg['path']
    action [:add, :config]
  end
  site_cfg['host_header'].each do |h|
    iis_site site_cfg['site_name'] do
      host_header h['host_header']
      action [:config]
    end
    raise"The host headers for #{site_cfg['site_name']} are #{site_cfg['host_header']}" if true
  end
  site_cfg['pool_name'].each do |p|
    iis_site site_cfg['site_name'] do
      application_pool p['pool_name']
      action [:config]
    end
    raise"The pool name for #{site_cfg['site_name']} are #{site_cfg['pool_name']}"
  end
end