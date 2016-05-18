require "spec"
require "../../src/legends/**"


class DummyResource < Legends::Resource
  @@resource = "champion"
end


describe Legends::Resource do

  describe "build_url" do
    it "builds a url for a resource" do
      DummyResource.new.build_url("BR", "my_secret_api_key").should eq "https://br.api.pvp.net/api/lol/br/v1.2/champion?api_key=my_secret_api_key"
    end

  end

end
