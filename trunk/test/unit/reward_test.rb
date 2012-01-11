require 'test_helper'

class RewardTest < ActiveSupport::TestCase

  test "reward is available" do
    @reward = rewards(:not_available_because_of_user_limit)
    assert !@reward.available?
    @reward = rewards(:not_available_because_of_date)
    assert !@reward.available?
    @reward = rewards(:reward_available)
    assert @reward.winners.count == 0, "Somebady has reward" 
    assert @reward.expirationDate - DateTime.now > 0.seconds, "Time is up " + @reward.expirationDate.to_s + " " + DateTime.now.to_datetime.to_s
    assert @reward.available?, "Reward is available"
  end

  test "winning the reward by rich user" do
    @reward = rewards(:reward_available)
    @richUser = User.find(users(:rich_without_rewards))
    assert @richUser.rewards.empty?, "User has rewards!"
    @pointSumA = @richUser.pointSum(point_kinds(:public)) 
    assert @pointSumA >= @reward.priceInPoints, " Rich user cant get reward ! " + @pointSumA.to_s + " " + @reward.priceInPoints.to_s
    assert @reward.availableFor?(@richUser), "Rich user cant get reward!"
    assert @richUser.collect(@reward), "Cant collect reward! "  + @richUser.errors.full_messages.to_s
    assert !@richUser.rewards.empty?, "User has no rewards!"
    @pointSumB = @richUser.pointSum(point_kinds(:public)) 
    assert @pointSumA != @pointSumB, "Reward cost nothing! " + @pointSumA.to_s + " " + @pointSumB.to_s
  end

  test "blocking rewards for poor user" do
    @reward = rewards(:reward_available)
    @poorUser = User.find(users(:poor))
    assert !@reward.availableFor?(@poorUser), "Poor user can get reward!"
    assert !@poorUser.collect(@reward), "Poor user too rich!"
  end

  test "sponsor should have right to point kinds when definining reward" do
    @ordinary_user = nil
    @r = Reward.new
    ### 1. Define reward with public points and assert error
    
    ### 2. Define reward with private points and assert true when saving reward
    # assert false
  end

end
