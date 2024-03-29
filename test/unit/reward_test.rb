require 'test_helper'

class RewardTest < ActiveSupport::TestCase

  test "reward is available" do
    @reward = rewards(:not_available_because_of_user_limit)
    assert !@reward.available?
    @reward = rewards(:not_available_because_of_date)
    assert !@reward.available?
    @reward = rewards(:reward_available)
    assert @reward.winners.count == 0, "Somebady has reward" 
    assert @reward.expiration_date - DateTime.now > 0.seconds, "Time is up " + @reward.expiration_date.to_s + " " + DateTime.now.to_datetime.to_s
    assert @reward.available?, "Reward is available"
  end

  test "winning the reward by rich user" do
    @reward = rewards(:reward_available)
    @richUser = User.find(users(:rich_without_rewards))
    assert @richUser.rewards.empty?, "User has rewards!"
    @point_sumA = @richUser.point_sum(point_kinds(:public)) 
    assert @point_sumA >= @reward.price_in_points, " Rich user cant get reward ! " + @point_sumA.to_s + " " + @reward.price_in_points.to_s
    assert @reward.available_for?(@richUser), "Rich user cant get reward!"
    assert @richUser.collect(@reward), "Cant collect reward! "  + @richUser.errors.full_messages.to_s
    assert !@richUser.rewards.empty?, "User has no rewards!"
    @point_sumB = @richUser.point_sum(point_kinds(:public)) 
    assert @point_sumA != @point_sumB, "Reward cost nothing! " + @point_sumA.to_s + " " + @point_sumB.to_s
  end

  test "blocking rewards for poor user" do
    @reward = rewards(:reward_available)
    @poorUser = User.find(users(:poor))
    assert !@reward.available_for?(@poorUser), "Poor user can get reward!"
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
