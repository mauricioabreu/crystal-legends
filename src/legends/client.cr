require "http/client"

module Legends

  class Client

    def initialize(region : String, api_key : String)
      @region = region
      @api_key = api_key
    end

  end

end
