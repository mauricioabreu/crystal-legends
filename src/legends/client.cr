require "http/client"

require "./champion"

module Legends

  class Client

    def initialize(region : String, api_key : String)
      @region = region
      @api_key = api_key
    end

    def champions(id = nil)
      champion = Champion.new(@region, @api_key)
      champion.find(id)
    end

  end

end
