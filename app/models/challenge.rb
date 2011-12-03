class Challenge < ActiveRecord::Base
  belongs_to :game
  has_one :action
end
