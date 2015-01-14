#IIS web server role features
default['iis_nativex']['features'] = ["IIS-HttpLogging","IIS-CustomLogging","IIS-LoggingLibraries","IIS-ODBCLogging","IIS-RequestMonitor","IIS-HttpTracing","IIS-BasicAuthentication","IIS-CertProvider","IIS-ClientCertificateMappingAuthentication","IIS-DigestAuthentication","IIS-IISCertificateMappingAuthentication","IIS-IPSecurity","IIS-URLAuthorization","IIS-WindowsAuthentication","IIS-ApplicationDevelopment","IIS-NetFxExtensibility45","IIS-ApplicationInit","IIS-ASP","IIS-ASPNET45","IIS-CGI","IIS-ISAPIExtensions","IIS-ISAPIFilter","IIS-ServerSideIncludes","IIS-WebSockets","IIS-HttpCompressionDynamic","IIS-WebServerManagementTools","IIS-ManagementConsole","IIS-ManagementService","IIS-ManagementScriptingTools","IIS-HttpRedirect"]
#IIS app pool name
default['iis_nativex']['pool_name'] = ["api.w3i.com", "ml.w3i.com"]
#IIS app pool runtime version
default['iis_nativex']['runtime_version'] = "4.0"
#IIS app pool pipeline mode
default['iis_nativex']['pipeline_mode'] = :Integrated
#IIS site name
default['iis_nativex']['site_name'] = ["api.w3i.com","ml.w3i.com"]