require File.expand_path("spec/spec_helper.rb")

describe Reward do

  fixtures :rewards
  fixtures :users
  
  before(:all) do
    @user = User.create!(:email => "aaa1@bbb1.com", :password => "secret")
    @pointKind = PointKind.new  
  end

  before(:each)do
    @reward = Reward.create!(:sponsor => @user, :creator => @user, :priceInPoints => 10, :pointKind => @pointKind)
  end

  describe '#available?' do    

    it 'returns true if userLimit is empty' do
      @reward.available?.should be_true   
    end
    
    it 'returns true if expirationDate is empty' do
      @reward.available?.should be_true
    end

    it 'returns true if userLimit is greater then winners ' do
      @reward.winners.count.should eq(0)
      @reward.userLimit = 0;
      @reward.available?.should be_false
      @reward.userLimit = 1;
      @reward.available?.should be_true
    end
    
    it 'returns false if expirationDate is in past' do
      @reward = Reward.new
      @reward.expirationDate = DateTime.now - 1.second
      @reward.available?.should be_false 
    end
  end

  describe '#availableFor?' do
    it 'returns true if Reward#available? and user has enought points to get it' do
      @reward.priceInPoints = 10
      @reward.pointKind = @pointKind
      @mark = Mark.new(:user => @usser, :pointKind => @pointKind, :pointSum => 0)
      @user.marks << @mark
      @reward.availableFor?(@user).should be_false
      @mark.pointSum += 10
      @mark.save
      @reward.availableFor?(@user).should be_true
    end

    it 'retruns false for poor user and car reward :)' do
      @user = users(:poor)
      @reward = rewards(:car)
      @reward.availableFor?(@user).should be_false
    end
  end
end
