require "http/client"

require "./champion"
require "./static"

module Legends
  # Main class to expose the underlying resources.
  # All resources should be explored like this:
  # ```
  # client = Legends::Client("NA", "my_secret_key_here")
  # champion = client.champions.find(1, "BR", "v1.2")
  # ```
  class Client
    getter :champions, :static

    def initialize(region : String, api_key : String)
      @region = region
      @api_key = api_key
      @champions = ChampionResource.new(region, api_key)
      @static = StaticResource.new(api_key)
    end
  end
end
