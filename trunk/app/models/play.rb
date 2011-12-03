class Play < ActiveRecord::Base
  belongs_to :game
  belongs_to :player, :class_name => "User", :foreign_key => :player_id
  has_many :actions
end
