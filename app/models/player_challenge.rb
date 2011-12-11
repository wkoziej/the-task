class PlayerChallenge < ActiveRecord::Base
  belongs_to :play
  belongs_to :challenge

  def initialize(params = nil) 
    super(params) 
  end 
  
  state_machine :status, :initial => :unfinished do
    
    state :finished do
    end

    state :canceled do
    end
  
    event :finish do
      transition :unfinished => :finished
    end
    
    event :cancel do
      transition :unfinished => :canceled
    end
    
  end
end
