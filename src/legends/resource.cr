require "http/client"

module Legends

  class Resource

    def initialize(region : String, api_key : String)
      @region = region
      @api_key = api_key
    end

    def build_url
      "https://#{@region.downcase}.api.pvp.net/api/lol/#{@region.downcase}/v1.2/#{@@resource}?api_key=#{@api_key}"
    end

    def find(id = nil)
      url = build_url
      response = HTTP::Client.get(url)

      unless response.success?
        raise Exception.new("Could not terminate the request")
      end

      puts response.body

    end

  end

end
