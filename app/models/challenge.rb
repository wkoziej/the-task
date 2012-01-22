# Model wyzwania/zadania
class Challenge < ActiveRecord::Base
  belongs_to :game
  belongs_to :point_kind

  attr_accessible :title, :description, :points, :latitude, :longitude, :type, :point_kind_id

  validates_presence_of :point_kind, :points, :title, :description


  validates_inclusion_of :type, :in => %w( CaptureCode EnterMessage ConfirmPosition ) #, :message => "extension %s is not included in the list"

  CHALLENGE_TYPES = [  [I18n.t(:enter_message), "EnterMessage" ], 
                       [I18n.t(:capture_code),  "CaptureCode"] ,
                       [I18n.t(:confirm_position),  "ConfirmPosition"] 
                    ]
  
  CHALLENGE_CLASS_MAPPING = { "EnterMessage" => "EnteringMessage", "CaptureCode" => "CapturingCode", "ConfirmPosition" => "PositionConfirmation"}

  def player_challenge_instance(params)
    @playerChallenge = eval(CHALLENGE_CLASS_MAPPING[self.class.to_s] + '.new')
    @playerChallenge.play_id = params[:play_id]
    @playerChallenge.challenge_id = params[:challenge_id]
    # Return instance
    @playerChallenge
  end

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
