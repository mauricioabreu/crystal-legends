module Legends

  class Resource

    def build_url(region : String, api_key : String)
      "https://#{region.downcase}.api.pvp.net/api/lol/#{region.downcase}/v1.2/#{@@resource}?api_key=#{api_key}"
    end

  end

end
