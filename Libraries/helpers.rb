class Chef::Recipe::BindingsString
	# We can call this with BindingsString.getBindingsStringFromSiteConfig
    def self.getBindingsStringFromSiteConfig( site_cfg )
      bindingString = []
      site_cfg[host_header].each do |header|
        puts "#{site_cfg[:protocol]}/*:#{site_cfg[:port]}:#{header}"
    	bindingString.push(header)
      end
      Chef::Log.debug("About to create #{bindingString.length}")
      bindingString
    end
end