class Reward < ActiveRecord::Base
  belongs_to :sponsor, :class_name => "User", :foreign_key => :sponsor_id
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  belongs_to :pointKind
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_presence_of :sponsor, :creator, :priceInPoints, :pointKind
  has_many :reward_collections
  has_many :winners, :through => :reward_collections

  def available?
    (userLimit == nil or winners.count < userLimit) and 
      (expirationDate == nil or expirationDate > DateTime.now)
  end

  def availableFor?(user)
    available? and user.pointSum(pointKind) >= priceInPoints
  end

end
