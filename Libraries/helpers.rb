module iisNativexHelper
  def self.getBindingsStringFromSiteConfig( site_cfg )
    bindingString = ''
    site_cfg[host_header].each do |header|
    	puts "#{site_cfg[:protocol]}/*:#{site_cfg[:port]}:#{header}"
    	elements.push(header)
    end
    return bindingString
  end
end