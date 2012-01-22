# Model of position confirmation challenge
class PositionConfirmation  < PlayerChallenge
  # Validations
  validates_presence_of :longitude, :on => :update
  validates_presence_of :latitude, :on => :update
  attr_accessible :latitude, :longitude
end
