class PlayerChallenge < ActiveRecord::Base
  belongs_to :play
  belongs_to :challenge
end
