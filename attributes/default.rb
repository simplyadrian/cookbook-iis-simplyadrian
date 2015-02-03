#Default NativeX IIS web server role features
default['iis-nativex']['features'] = []
#IIS default app pool names
default['iis-nativex']['enabled_pools'] = [[{:pool_name => "api.w3i.com", :runtime_version => "4.0", :pipeline_mode => :Integrated, :pool_username => "#{creds['api']['app_pool_username']}", :pool_password => "#{creds['api']['app_pool_password']}"}]
#IIS default site names
default['iis-nativex']['enables_sites'] = [{:site_name => "api.w3i.com", :protocol => :http, :port => 80, :path => "C:\\inetpub\\wwwroot\\#{site_name}", :host_header => ['','api.w3i.com','appclick.co'], :pool_name => "api.w3i.com"}]
