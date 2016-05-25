require "json"
require "./resource"


module Legends

  class ChampionResource < Resource
    @resource = "champion"

    def find
      process_response(get(@resource), Champions).champions
    end

    def find(id : Int32)
      process_response(get(@resource + "/#{id}"), Champion)
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
