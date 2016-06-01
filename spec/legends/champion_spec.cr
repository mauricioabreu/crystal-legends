require "./../spec_helper"

describe Legends::ChampionResource do

  context "when finding for champions" do

    it "finds a champion by id" do
      response = Fixture.load("champion.json")
      WebMock.wrap do
        WebMock.stub(:get, "br.api.pvp.net/api/lol/br/v1.2/champion/1?api_key=my_secret_key").
          to_return(response)
        champion = Legends::ChampionResource.new("BR", "my_secret_key").find(1, "BR")
        champion.id.should eq 1
        champion.active.should eq true
      end
    end

    it "finds all champions" do
      response = Fixture.load("champions.json")
      WebMock.wrap do
        WebMock.stub(:get, "br.api.pvp.net/api/lol/br/v1.2/champion?api_key=my_secret_key").
          to_return(response)
        champions = Legends::ChampionResource.new("BR", "my_secret_key").find("BR")
        champions.should be_a(Array(Legends::Champion))
      end
    end

  end

end
