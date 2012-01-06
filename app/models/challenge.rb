class Challenge < ActiveRecord::Base
  belongs_to :game
  belongs_to :pointKind

  attr_accessible :title, :description, :points, :latitude, :longitude, :type, :pointKind_id

  validates_presence_of :pointKind, :points, :title, :description
  validates_inclusion_of :type, :in => %w( CaptureCode EnterMessage ConfirmPosition ) #, :message => "extension %s is not included in the list"


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
