# Model reprezentujacy wyzwanie/zadanie gracza
class PlayerChallenge < ActiveRecord::Base
  belongs_to :play
  belongs_to :challenge

  attr_accessible :latitude, :longitude

  def initialize(params = nil) 
    super(params) 
  end 
  
  state_machine :status, :initial => :unfinished do
    
    after_transition :unfinished => :finished, :do => :give_points_to_user_and_update_play_status

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

  def give_points_to_user_and_update_play_status
    play.player_challenge_finished(challenge) 
  end

end
