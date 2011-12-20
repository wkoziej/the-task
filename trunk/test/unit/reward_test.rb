require 'test_helper'

class RewardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "winning the reward by rich user" do
    @richUser = User.find(users(:rich))
    @reward = rewards(:one)
    assert @richUser.rewards.empty?, "Uzytkownik posiada juz nagrody!"
    assert @richUser.pointSum('public') < @reward.priceInPoints, " Bogatego usera nie stac na nagrode!"
    assert @richUser.collect(@reward), "Nie udalo sie zebrac nagrody "  + @richUser.errors.full_messages.to_s
    assert !@richUser.rewards.empty?, "Uzytkownik nie posiada mimo tego, ze ja wygral!"
  end

  test "blocking rewards for poor user" do
  end

end
