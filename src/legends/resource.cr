require "json"
require "http/client"

module Legends

  class Resource

    def initialize(region : String, api_key : String)
      @region = region
      @api_key = api_key
    end

    def build_url(path : String)
      "https://#{@region.downcase}.api.pvp.net/api/lol/#{@region.downcase}/v1.2/#{path}?api_key=#{@api_key}"
    end

    def get(path)
      url = build_url(path)
      response = HTTP::Client.get(url)

      unless response.success?
        raise Exception.new("Could not terminate the request successfully")
      end

      @struct.from_json(response.body)

    end

  end

end
