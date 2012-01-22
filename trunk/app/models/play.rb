# Play model
class Play < ActiveRecord::Base
  # Relations
  belongs_to :game
  belongs_to :player, :class_name => "User", :foreign_key => :player_id
  has_many :player_challenges

  def initialize(params = nil) 
    super(params) 
    if (game and player)
      start_play
    else
      raise ArgumentError, "game and player parameter cannot be null"
    end
  end 

  def player_challenge_finished(challenge) 
    player.update_points(challenge.point_kind, challenge.points) 
    finish_if_all_challanges_finished
    save
  end

  state_machine :status, :initial => :started do
    
    after_transition [:started, :unfinished] => [:finished, :canceled], :do => lambda { |play| play.finished_at = DateTime.now }

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

private

  def start_play
    started_at = Time.now
    game.challenges.each do |challenge|
      player_challenges << challenge.player_challenge_instance(:challenge_id => challenge.id, :play_id => self.id) 
    end
  end

  def finish_if_all_challanges_finished
    # todo: find -> count 
    unfinished_challenges_counter = PlayerChallenge.find_all_by_play_id_and_status(self.id, :unfinished).count
    if unfinished_challenges_counter == 0 
      finish
      save
    end  
  end

end
