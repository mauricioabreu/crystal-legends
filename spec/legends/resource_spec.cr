require "./../spec_helper"

class DummyResource < Legends::Resource
end

class DummyMapping
  JSON.mapping({
    id:   Int32,
    name: String,
  })
end

describe Legends::Resource do

  context "when building an URL" do
    context "when it has the path to build" do
      it "builds a URL for a resource" do
        DummyResource.new("BR", "my_secret").build_url("v1.4/dummy_path").should eq "https://br.api.pvp.net/v1.4/dummy_path?api_key=my_secret"
      end
    end

    context "when it has a query filter parameters" do
      it "build a URL for a resource with query string parameters" do
        DummyResource.new("BR", "my_secret").build_url("v1.4/dummy_path", {:foo => "hello", :bar => "world"}).should eq "https://br.api.pvp.net/v1.4/dummy_path?api_key=my_secret&foo=hello&bar=world"
      end
    end

  end

  describe "#process_response" do
    it "returns an object from a JSON mapping" do
      foo = DummyResource.new("BR", "my_secret").process_response(%({"id": 1, "name": "foo"}), DummyMapping)
      foo.id.should eq 1
      foo.name.should eq "foo"
    end
  end


  context "when requesting a resource" do

    context "with valid parameters" do
      Spec.before_each do
        WebMock.stub(:get, "https://br.api.pvp.net/api/lol/br/v1.2/champion/1?api_key=my_secret").
          to_return(%({"id": 1, "name": "foo"}))
      end

      it "returns a JSON response body" do
        response = JSON.parse(DummyResource.new("BR", "my_secret").get("api/lol/br/v1.2/champion/1"))
        response["id"].should eq 1
        response["name"].should eq "foo"
      end

    end

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
