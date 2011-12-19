class Reward < ActiveRecord::Base
  belongs_to :sponsor, :class_name => "User", :foreign_key => :sponsor_id
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  belongs_to :pointKind
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_presence_of :sponsor, :creator, :priceInPoints, :pointKind
end
