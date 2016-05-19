require "spec"
require "../../src/legends/**"


class DummyResource < Legends::Resource
  @@resource = "champion"
  @region = "BR"
  @api_key = "my_secret"
end


describe Legends::Resource do

  describe "build_url" do
    it "builds a url for a resource" do
      DummyResource.new("BR", "my_api_key").build_url.should eq "https://br.api.pvp.net/api/lol/br/v1.2/champion?api_key=my_api_key"
    end

  end

end
