class EnteringMessage < PlayerChallenge
  # Validations
  validates_presence_of :message, :on => :update
  attr_accessible :message
end
