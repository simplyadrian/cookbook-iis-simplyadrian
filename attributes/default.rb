# Default simplyadrian IIS web server role features
default['iis-simplyadrian']['features'] = []
# IIS default app pool names
default['iis-simplyadrian']['enabled_pools'] = []
# IIS default site names
default['iis-simplyadrian']['enables_sites'] = []
# Configuration commands passed to the iis_config resource.
# Example #node.default['iis-simplyadrian']['cfg_cmd'] = ["/section:handlers /+[name='svc-Integrated-4.0',path='*.svc',verb='*',type='ISAPI']"]
default['iis-simplyadrian']['cfg_cmd'] = []
# Services that will be started and stopped during ARR install
default['iis-simplyadrian']['services'] = ['W3SVC','WMSVC']
# ARR application and dependencies installation array
default['iis-simplyadrian']['arr_application'] = []
# ARR Helper schema directory
default['iis-simplyadrian']['arr_helper']['schema_dir'] = 'C:\\Windows\\System32\\inetsrv\\config\\'
# ARR xForwardedForHeaderName
default['iis-simplyadrian']['arr_helper']['x_forwarded_for_header_name'] = 'simplyadrian-clientip'
# ARR sslHeaderName
default['iis-simplyadrian']['arr_helper']['ssl_header_name'] = 'X-ARR-SSL'
# ARR clientHeaderName
default['iis-simplyadrian']['arr_helper']['client_header_name'] = 'X-ARR-ClientCert'
# ARR logGuidName
default['iis-simplyadrian']['arr_helper']['log_guid_name'] = 'X-ARR-LOG-ID'
