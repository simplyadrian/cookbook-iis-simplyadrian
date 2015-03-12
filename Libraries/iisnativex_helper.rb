#module IisNativex
#  module Helper

#    def collection
#      Chef::Log.debug("Compiling string values from site config")
#      hash = {"http/*:80:stuff","http/*:80:and","http/*:80:things"}
#      array = []
#      array.push(hash)
#      @collection = array
#    end

#  end
#end

module IisNativex
  module Helper
  
    def get_bindings_string( site_cfg )
      Chef::Log.debug("Parsing site_cfg to provide values for key pairs.")

      bindingString = []

      site_cfg[:host_header].each do |header|
      bindingString << "#{site_cfg[:protocol]}/*:#{site_cfg[:port]}:#{header}"
      end

    Chef::Log.debug("The string being used for each site equals #{bindingString.length}")
    return bindingString
    end
  end
end