require File.expand_path("spec/spec_helper.rb")

describe Play do
  before(:all) do
    @player = FactoryGirl.create(:user)
    @game = FactoryGirl.create(:game)
    @first_challenge = @game.challenges.first
  end

  before(:each) do
    @play = Play.new(:game => @game, :player => @player) 
    @play.save
  end

  describe '#new' do    
    context "Non empty game and player parameter" do

      it 'initializes play with the same number of challenges as game' do
        @game.challenges.count.should eq(1)
        @play.player_challenges.count.should eq(@game.challenges.count)
      end
      
      it 'moves play to :started state' do
        @play.started?.should be_true
      end

    end
    context "Empty game or empty player parameter" do
      it 'should raise exception' do
        expect { Play.new(:game => nil, :player => @player) }.should raise_error 
        expect { Play.new(:game => @hame, :player => nil) }.should raise_error
      end
    end
  end

  describe '#player_challenge_finished' do
    
    context "Working with challenge" do
      it 'increses user points with challenges points' do
        player_points_before = @player.point_sum(@first_challenge.point_kind)
        @play.player_challenge_finished(@first_challenge)
        @player.point_sum(@first_challenge.point_kind).should eq(player_points_before + @first_challenge.points)
      end

    end

  end

end
