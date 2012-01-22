require File.expand_path("spec/spec_helper.rb")

describe Reward do
  
  before(:all) do
    @winner = FactoryGirl.create(:winner)
    @point_kind = PointKind.new  
    @car = FactoryGirl.create(:car)
  end

  before(:each)do
    @reward = FactoryGirl.create(:reward)
  end

  describe '#available?' do    

    it 'returns true if user_limit is empty' do
      @reward.available?.should be_true   
    end
    
    it 'returns true if expiration_date is empty' do
      @reward.available?.should be_true
    end

    it 'returns true if user_limit is greater then winners ' do
      @reward.winners.count.should eq(0)
      @reward.user_limit = 0;
      @reward.available?.should be_false
      @reward.user_limit = 1;
      @reward.available?.should be_true
    end
    
    it 'returns false if expiration_date is in past' do
      @reward = Reward.new
      @reward.expiration_date = DateTime.now - 1.second
      @reward.available?.should be_false 
    end
  end

  describe '#available_for?' do
    it 'returns true if Reward#available? and user has enought points to get it' do
      @reward.price_in_points = 10
      @reward.point_kind = @point_kind
      @mark = Mark.new(:user => @winner, :point_kind => @point_kind, :point_sum => 0)
      @winner.marks << @mark
      @reward.available_for?(@winner).should be_false
      @mark.point_sum += 10
      @mark.save
      @reward.available_for?(@winner).should be_true
    end

    it 'retruns false for poor user and car reward :)' do
      @car.available_for?(@winner).should be_false
    end
  end
end
