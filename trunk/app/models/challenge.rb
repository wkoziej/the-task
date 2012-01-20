class Challenge < ActiveRecord::Base
  belongs_to :game
  belongs_to :pointKind




  attr_accessible :title, :description, :points, :latitude, :longitude, :type, :pointKind_id

  validates_presence_of :pointKind, :points, :title, :description


  validates_inclusion_of :type, :in => %w( CaptureCode EnterMessage ConfirmPosition ) #, :message => "extension %s is not included in the list"

  def challenge_types 
    [  [I18n.t(:enter_message), "EnterMessage" ], 
       [I18n.t(:capture_code),  "CaptureCode"] ,
       [I18n.t(:confirm_position),  "ConfirmPosition"] 
    ];
  end

  def player_challenge_instance(params)
    case self.class.to_s
    when "EnterMessage"
      @playerChallenge = EnteringMessage.new(params)
    when "CaptureCode"
      @playerChallenge = CapturingCode.new(params)
    when "ConfirmPosition"
      @playerChallenge = PositionConfirmation.new(params)
    end    
  end

#  validates_inclusion_of :type, :in => Challenge.challenge_types.collect {|elem| elem[1]} #, :message => "extension %s is not included in the list"

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
