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

  def pointSum(pointKind)
    mark = Mark.find_by_user_id_and_pointKind_id(self, pointKind)
    mark == nil ? 0 : mark.pointSum
  end

  def collect(reward)
    mark = Mark.find_by_user_id_and_pointKind_id(self, reward.pointKind)
    if reward.available?  and mark != nil and mark.pointSum >= reward.priceInPoints
      newReward = RewardCollection.new
      newReward.winner = self
      newReward.reward = reward
      reward_collections << newReward
      mark.pointSum -= reward.priceInPoints
      mark.save
      save
    end
  end


  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token.info
    if user = User.where(:email => data["email"]).first
      user
    else
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end
end
