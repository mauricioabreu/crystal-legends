require "json"
require "./resource"


module Legends

  class Champion < Resource
    @resource = "champion"

    def find
      process_response(get(@resource), ChampionsJSON).champions
    end

    def find(id : Int32)
      process_response(get(@resource + "/#{id}"), ChampionJSON)
    end

  end

  class ChampionJSON

    JSON.mapping({
      id:                 Int32,
      active:             Bool,
      botEnabled:         Bool,
      freeToPlay:         Bool,
      botMmEnabled:       Bool,
      rankedPlayEnabled:  Bool,
    })

  end

  class ChampionsJSON

    JSON.mapping({
      champions: Array(ChampionJSON),
    })

  end

end
