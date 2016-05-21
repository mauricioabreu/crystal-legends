require "json"
require "./resource"


module Legends

  class Champion < Resource
    @resource = "champion"
    @struct = ChampionJSON

    def find(id = nil)
      path = @resource
      if id
        path += "/#{id}"
      end
      get(path)
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

end
