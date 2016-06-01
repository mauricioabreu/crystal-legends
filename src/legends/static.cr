require "json"
require "./resource"

module Legends
  class StaticResource
    def initialize(api_key : String)
      @api_key = api_key
      @region = "global"
    end

    def champions
      Static::ChampionResource.new(@region, @api_key)
    end
  end

  module Static
    class ChampionResource < Resource
      def find(id : Int32, region : String, version = "v1.2")
        path = resource(region, version) + "/#{id}"
        process_response(get(path), Champion)
      end

      def find(region : String, version = "v1.2")
        path = resource(region, version)
        process_response(get(path), Champions)
      end

      def resource(region : String, version : String)
        "api/lol/static-data/#{region.downcase}/#{version}/champion"
      end
    end

    class Champion
      JSON.mapping({
        id:    Int32,
        title: String,
        name:  String,
        key:   String,
      })
    end

    class Champions
      JSON.mapping({
        data: Hash(String, Champion),
      })
    end

  end
end
