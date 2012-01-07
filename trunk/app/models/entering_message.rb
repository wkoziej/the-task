class EnteringMessage < PlayerChallenge
  # Validations
  validates_presence_of :longitude, :on => :update
  validates_presence_of :latitude, :on => :update
  attr_accessible :longitude, :latitude
end
