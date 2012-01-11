require File.expand_path("spec/spec_helper.rb")

describe Reward do
  before do
    @user = User.create!(:email => "aaa@bbb.com", :password => "secret")
    @pointKind = PointKind.new
    @reward = Reward.create!(:sponsor => @user, :creator => @user, :priceInPoints => 10, :pointKind => @pointKind)
 end

  describe '#available?' do    
    
    it 'returns true if userLimit is empty' do
      @reward = Reward.new
      @reward.userLimit = nil
      @reward.available?.should be_true   
    end
    
    it 'returns true if expirationDate is empty' do
      @reward = Reward.new
      @reward.expirationDate = nil
      @reward.available?.should be_true
    end

    it 'returns false if userLimit reached' do
      @reward.userLimit = 0;
      @reward.available?.should be_false
      @reward.userLimit = 1;
      @reward.available?.should be_true
      # @user.collect (@reward)
      # @reward.available?.should be_false    
    end
    
    it 'returns false if expirationDate is in past' do
      @reward = Reward.new
      @reward.expirationDate = DateTime.now - 1.second
      @reward.available?.should be_false 
    end

  end
end
