require "spec"
require "webmock"
require "../../src/legends/**"


class DummyResource < Legends::Resource
  @resource = "champion"
end


describe Legends::Resource do

  describe "#build_url" do
    it "builds a url for a resource" do
      DummyResource.new("BR", "my_secret").build_url("dummy_path").should eq "https://br.api.pvp.net/api/lol/br/v1.2/dummy_path?api_key=my_secret"
    end
  end

  context "when requesting a resource" do
    context "with invalid parameters" do

      Spec.before_each do
        WebMock.stub(:get, "https://br.api.pvp.net/api/lol/br/v1.2/invalid_path?api_key=my_secret").
          to_return(status: 500)
      end

      it "raises an exception because the request failed" do
        expect_raises(Exception) do
          DummyResource.new("BR", "my_secret").get("invalid_path")
        end
      end

    end
  end

end
