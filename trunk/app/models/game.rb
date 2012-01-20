# Model gry
class Game < ActiveRecord::Base
  attr_protected :status


  # Relations
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  has_many :challenges
  has_many :plays

  # Validations
  validates_presence_of :status, :creator, :title, :description

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def initialize(params = nil) 
    super(params) 
  end 
  
  state_machine :status, :initial => :new do
    
    state :active do
    end

    state :archived do
    end
  
    event :activate do
      transition :new => :active, :if => :can_activate?
    end
    
    event :archive do
      transition :active => :archived
    end
    
  end

  def can_archive?
    active? and !challenges.empty?
  end

  def can_activate?
    !challenges.empty? and !archived? and !active?
  end
   
end
