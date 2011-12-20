class Play < ActiveRecord::Base
  # Relations
  belongs_to :game
  belongs_to :player, :class_name => "User", :foreign_key => :player_id
  has_many :player_challenges

  def initialize(params = nil) 
    super(params) 
  end 

  state_machine :status, :initial => :started do
    
    after_transition [:started, :unfinished] => [:finished, :canceled], :do => lambda { |play| play.finishedAt = DateTime.now }

    state :finished do
    end

    state :canceled do
    end
  
    event :finish do
      transition :started => :finished
    end
    
    event :cancel do
      transition :started => :canceled
    end
    
  end


end
