require 'test_helper'

class RewardCollectionTest < ActiveSupport::TestCase
  test "states transition" do
    @r = RewardCollection.find(reward_collections(:reward_coll1))
    assert @r.choosen?, "status != choosen"
    assert @r.collectDate == nil, "collectDate != nil"
    assert @r.collect, "Cant collect reward"
    assert @r.collected?, "Status != collected"
    assert @r.collectDate != nil, "collectDate == nil"

    @r = RewardCollection.find(reward_collections(:reward_coll2))    
    assert @r.choosen?
    assert @r.reject
    assert @r.rejected?
    
  end
end
