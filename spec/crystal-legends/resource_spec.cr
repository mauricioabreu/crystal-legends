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
    end

  end

end
