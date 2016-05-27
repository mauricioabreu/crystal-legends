require "json"
require "./resource"


module Legends

  class ChampionResource < Resource

    def find(region : String, version : String)
      path = get(resource(region, version))
      process_response(get(path), Champions).champions
    end

    def find(region : String, version : String, id : Int32)
      path = get(resource(region, version) + "/#{id}")
      process_response(get(path), Champion)
    end

    def resource(region : String, version : String)
      "api/lol/#{region.downcase}/#{version}/champion"
    end

  end

  class Champion

    JSON.mapping({
      id:                 Int32,
      active:             Bool,
      botEnabled:         Bool,
      freeToPlay:         Bool,
      botMmEnabled:       Bool,
      rankedPlayEnabled:  Bool,
    })

  end

  class Champions

    JSON.mapping({
      champions: Array(Champion),
    })

  end

end
