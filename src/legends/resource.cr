require "json"
require "http/client"
require "uri"

module Legends

  # Main model to create a resource.
  # Every endpoint should subclass this.
  class Resource

    def initialize(region : String, api_key : String)
      @region = region
      @api_key = api_key
    end

    # Build the URL to make the request.
    # All League of Legends URLs follow the same format.
    # Only the region changes in the hostname.
    # After it we have the path, the API key and the query string to
    # compose a proper filter.
    # *path* is the resource path like champions.
    # *query* is a Hash to build a query string like param1=foo
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

    # Returns the body of the request.
    # It should be encoded as JSON format.
    def get(path, query = {} of String => String)
      url = build_url(path, query)
      response = HTTP::Client.get(url)

      unless response.success?
        raise Exception.new("Could not terminate the request successfully")
      end

      response.body
    end

    # Process the JSON *data* using the given *mapper*.
    def process_response(data, mapper)
      mapper.from_json(data)
    end

  end

end
