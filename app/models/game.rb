class Game < ActiveRecord::Base
  # Relations
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  has_many :challenges
  has_many :plays

  # Validations
  validate :status, :presence => true
  validate :creator, :presence => true

  def initialize(params = nil) 
    super() 
    #self.status = "NEW"
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
