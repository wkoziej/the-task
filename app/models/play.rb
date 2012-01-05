# -*- coding: utf-8 -*-
class Play < ActiveRecord::Base
  # Relations
  belongs_to :game
  belongs_to :player, :class_name => "User", :foreign_key => :player_id
  has_many :player_challenges

  def initialize(params = nil) 
    super(params) 
    if (self.game and self.player)
      # Ropoczynamy nową grę
      self.startedAt = Time.now
      self.game.challenges.each do |challenge|
        @playerChallenge = nil
        logger.debug("challenge.class " + challenge.class.to_s);
        case challenge.class.to_s
        when "EnterMessage"
          @playerChallenge = EnteringMessage.new
        when "CaptureCode"
          @playerChallenge = CapturingCode.new
        end
        @playerChallenge.challenge = challenge
        @playerChallenge.play = self
        @playerChallenge.save
        player_challenges << @playerChallenge  
      end
    end
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
