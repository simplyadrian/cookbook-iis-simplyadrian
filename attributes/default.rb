# Default NativeX IIS web server role features
default['iis-nativex']['features'] = []
# IIS default app pool names
default['iis-nativex']['enabled_pools'] = []
# IIS default site names
default['iis-nativex']['enables_sites'] = []
# ARR Helper schema directory
default['iis-nativex']['arr_helper']['schema_dir'] = 'C:\\Windows\\System32\\inetsrv\\config\\'
# ARR xForwardedForHeaderName
default['iis-nativex']['arr_helper']['x_forwarded_for_header_name'] = 'nativex-clientip'
# ARR sslHeaderName
default['iis-nativex']['arr_helper']['ssl_header_name'] = 'X-ARR-SSL'
# ARR clientHeaderName
default['iis-nativex']['arr_helper']['client_header_name'] = 'X-ARR-ClientCert'
# ARR logGuidName
default['iis-nativex']['arr_helper']['log_guid_name'] = 'X-ARR-LOG-ID'
