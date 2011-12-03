class Action < ActiveRecord::Base
  belongs_to :play
  belongs_to :challenge
end
