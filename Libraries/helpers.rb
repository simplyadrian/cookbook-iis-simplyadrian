module IisNativex
  module Helper
  	def self.getBindingsString(site_cfg)
  	  Chef::Log.debug("Compiling string values from site config")
  	  bindingString = []
  	  site_cfg[:host_header].each do |header|
  	  	puts "http/*:80:#{header}"
  	  	bindingString.push(header)
  	  end
  	Chef::Log.debug("Site config bindings resolved to #{bindingString}")
    return bindingString
    end
  end
end