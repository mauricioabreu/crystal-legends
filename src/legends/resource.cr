require "json"
require "http/client"
require "uri"

module Legends

  class Resource

    def initialize(region : String, api_key : String)
      @region = region
      @api_key = api_key
    end

    def build_url(path : String, query = {} of String => String)
      url = "https://#{@region.downcase}.api.pvp.net/#{path}?api_key=#{@api_key}"
      if !query.empty?
        url = "#{url}&#{build_query(query)}"
      end
      url
    end

    private def build_query(query = {} of String => String)
      query.to_a.map {|o| "#{o[0]}=#{URI.escape(o[1].to_s)}" }.join("&")
    end

    def get(path, query = {} of String => String)
      url = build_url(path, query)
      response = HTTP::Client.get(url)

      unless response.success?
        raise Exception.new("Could not terminate the request successfully")
      end

      response.body
    end

    def process_response(data, mapper)
      mapper.from_json(data)
    end

  end

end
