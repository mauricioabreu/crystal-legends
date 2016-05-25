require "http/client"

require "./champion"

module Legends

  class Client
    getter :champions

    def initialize(region : String, api_key : String)
      @region = region
      @api_key = api_key
      @champions = ChampionResource.new(region, api_key)
    end

  end

end
