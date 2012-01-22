# Reward model
class Reward < ActiveRecord::Base
  belongs_to :sponsor, :class_name => "User", :foreign_key => :sponsor_id
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  belongs_to :point_kind
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_presence_of :sponsor, :creator, :price_in_points, :point_kind
  has_many :reward_collections
  has_many :winners, :through => :reward_collections
  
  def available?
    (user_limit.nil? || winners.count < user_limit) and 
      (expiration_date.nil? or expiration_date > DateTime.now)
  end

  def available_for?(user)
    available? and user.point_sum(point_kind) >= price_in_points
  end

end
