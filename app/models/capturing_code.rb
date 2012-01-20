# Model wykonania zadania zdobycia kodu
class CapturingCode < PlayerChallenge
  # Validations
  validates_presence_of :code, :on => :update
  attr_accessible :code
end
