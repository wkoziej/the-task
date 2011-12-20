class PlayerChallenge < ActiveRecord::Base
  belongs_to :play
  belongs_to :challenge

  attr_accessible :latitude, :longitude

  def initialize(params = nil) 
    super(params) 
  end 
  
  state_machine :status, :initial => :unfinished do
    
    after_transition :unfinished => :finished, :do => :update_points_and_play_status

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

  def update_points_and_play_status
    mark = Mark.find_or_create_by_user_id_and_pointKind_id(play.player, challenge.pointKind)
    mark.pointSum = 0 if mark.pointSum == nil
    mark.pointSum += challenge.points
    mark.save
    @unfinishedChallenges = PlayerChallenge.find_all_by_play_id_and_status(play.id, :unfinished)
    if @unfinishedChallenges.count == 0 
      play.finish
      play.save
    end
  end

end
