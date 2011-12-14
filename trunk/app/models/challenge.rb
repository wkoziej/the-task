class Challenge < ActiveRecord::Base
  belongs_to :game
  belongs_to :pointKind

  attr_accessible :title, :description, :points, :latitude, :longitude, :type
  
  def initialize(params = nil) 
    super(params) 
  end 
  
  state_machine :status, :initial => :new do
    
    state :active do
    end

    state :archived do
    end
  
    event :activate do
      transition :new => :active
    end
    
    event :archive do
      transition :active => :archived
    end
    
  end
end
