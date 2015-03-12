module IisNativex
  module Helper

    def collection
      Chef::Log.debug("Compiling string values from site config")
      hash = {"http/*:80:stuff","http/*:80:and","http/*:80:things"}
      array = []
      array.push(hash)
      @collection = array
    end

  end
end