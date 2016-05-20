require "./resource"


module Legends

  class Champion < Resource
    @resource = "champion"

    def find(id = nil)
      path = @resource
      if id
        path += "/#{id}"
      end
      get(path)
    end

  end

end
