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

  	Chef::Log.debug("Parsing the provided site_cfg to compile bindingString")
    def get_bindings_string( site_cfg )
      bindingString = ''
      site_cfg[:host_header].each do |header|
      bindingString << "#{site_cfg[:protocol]}/*:#{site_cfg[:port]}:#{header}"
      end
    Chef::Log.info("The string being used for each site equals #{bindingString.length}")
    end
  end
end