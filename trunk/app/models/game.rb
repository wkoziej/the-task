class Game < ActiveRecord::Base
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  has_many :challenges
  has_many :plays

  validate :status, :presence => true

  def initialize(params = nil) 
    super(nil) 
    self.status = "NEW"
  end 

end
