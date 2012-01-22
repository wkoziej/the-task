# Model of rewards collected by user
class RewardCollection < ActiveRecord::Base
  belongs_to :winner, :class_name => "User", :foreign_key => :winner_id
  belongs_to :reward
  validates_presence_of :reward, :winner


  def initialize(params = nil) 
    super(params) 
  end 

  state_machine :status, :initial => :choosen do

    after_transition :choosen => :collected, :do => lambda { |reward_collecion| reward_collecion.collect_date = DateTime.now }

    state :choosen do
    end

    state :collected do
    end
  
    state :reject do
    end
  
    event :collect do
      transition :choosen => :collected
    end
    
    event :reject do
      transition :choosen => :rejected
    end

    
  end

end
