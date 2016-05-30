require "./../spec_helper"

describe Legends::Champion do

  context "when finding a champion" do

    it "finds a champion by id" do
      response = Fixture.load("champion.json")
      WebMock.stub(:get, "br.api.pvp.net/api/lol/br/v1.2/champion/1?api_key=my_secret_key").
        to_return(response)
      champion = Legends::ChampionResource.new("BR", "my_secret_key").find(1, "BR")
      champion.id.should eq 1
      champion.active.should eq true
     end

  end

end
