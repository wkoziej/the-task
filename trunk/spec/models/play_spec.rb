require File.expand_path("spec/spec_helper.rb")

describe Play do

  describe '#new' do    
    context "Non empty game and player parameter" do
      it 'initializes play with the same number of challenges as game' do
        game = FactoryGirl.create(:game)
        player = FactoryGirl.create(:user)
        play = Play.new(:game => game, :player => player) 
        play.player_challenges.count.should eq(play.game.challenges.count)
      end
    end
  end

end
