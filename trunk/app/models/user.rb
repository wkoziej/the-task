# Model of application user
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable #followed by anything else you need

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :games
  has_many :plays
  has_many :marks
  has_many :reward_collections, :foreign_key => :winner_id
  has_many :rewards, :through => :reward_collections 
  has_many :assignments
  has_many :roles, :through => :assignments
  
 
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

  # has_many :rewards, :through => :users, :foreign_key => ""

  def point_sum(point_kind)
    mark = Mark.find_by_user_id_and_point_kind_id(self.id, point_kind.id)
    mark == nil ? 0 : mark.point_sum
  end

  def update_points (point_kind, points)
    mark = Mark.find_or_create_by_user_id_and_point_kind_id(self.id, point_kind)
    mark.point_sum += points
    mark.save 
  end


  def collect(reward)
    mark = Mark.find_by_user_id_and_point_kind_id(self.id, reward.point_kind)
    price_in_points =  reward.price_in_points
    if reward.available?  and mark != nil and mark.point_sum >= price_in_points
      reward_collections << RewardCollection.new(:winner => self, :reward => reward)
      mark.point_sum -= price_in_points
      mark.save and save
    end
  end


  def self.find_for_open_id(access_token, signed_in_resource=nil)
    email = access_token.info["email"]
    if user = User.where(:email => email).first
      user
    else
      User.create!(:email => email, :password => Devise.friendly_token[0,20])
    end
  end
end
