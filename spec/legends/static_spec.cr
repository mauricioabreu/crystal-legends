require "./../spec_helper"

describe Legends::StaticResource do
  context "when finding a champion" do
    it "return an instance of a static champion resource" do
      resource = Legends::StaticResource.new("my_secret_key").champions
      resource.should be_a(Legends::Static::ChampionResource)
    end

    it "finds a champion by id" do
      response = Fixture.load("static/champion.json")
      resource = Legends::StaticResource.new("my_secret_key").champions
      WebMock.wrap do
        WebMock.stub(:get, "global.api.pvp.net/api/lol/static-data/na/v1.2/champion/1?api_key=my_secret_key")
               .to_return(response)
        champion = resource.find(1, "NA")
        champion.name.should eq "Annie"
        champion.title.should eq "the Dark Child"
      end
    end

    it "finds all champions" do
      response = Fixture.load("static/champions.json")
      resource = Legends::StaticResource.new("my_secret_key").champions
      WebMock.wrap do
        WebMock.stub(:get, "global.api.pvp.net/api/lol/static-data/na/v1.2/champion?api_key=my_secret_key")
               .to_return(response)
        champions = resource.find("NA")
        champions.should be_a(Legends::Static::Champions)
      end
    end
  end
end
