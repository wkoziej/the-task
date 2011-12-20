require 'test_helper'

class RewardTest < ActiveSupport::TestCase

  test "game is available" do
    @reward = rewards(:not_available_because_of_user_limit)
    assert !@reward.available?
    @reward = rewards(:not_available_because_of_date)
    assert !@reward.available?
    @reward = rewards(:reward_available)
    assert @reward.winners.count == 0, "Somebady has reward" 
    assert @reward.expirationDate - DateTime.now < 0.seconds, "Time is up " + @reward.expirationDate.to_s + " " + DateTime.now.to_datetime.to_s
    assert @reward.available?, "Reward not available"
  end

  test "winning the reward by rich user" do
    @richUser = User.find(users(:rich_without_rewards))
    @reward = rewards(:reward_available)
    assert @richUser.rewards.empty?, "Uzytkownik posiada juz nagrody!"
    assert @richUser.pointSum('public') < @reward.priceInPoints, " Bogatego usera nie stac na nagrode!"
    assert @richUser.collect(@reward), "Nie udalo sie zebrac nagrody "  + @richUser.errors.full_messages.to_s
    assert !@richUser.rewards.empty?, "Uzytkownik nie posiada mimo tego, ze ja wygral!"
  end

  test "blocking rewards for poor user" do
  end

end
