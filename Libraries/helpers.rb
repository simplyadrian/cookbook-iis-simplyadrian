module NativeX
  module IIS
    module Helper
	# We can call this with BindingsString.getBindingsStringFromSiteConfig
    def self.getBindingsString
      bindingString = []
      site_cfg[host_header].each do |header|
        puts "http/*:80:#{header}"
    	bindingString.push(header)
      end
      Chef::Log.debug("About to create #{bindingString.length}")
      bindingString
    end
  end
end