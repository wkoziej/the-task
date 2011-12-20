class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :games
  has_many :plays
  has_many :marks
  has_many :reward_collections, :foreign_key => :winner_id
  has_many :rewards, :through => :reward_collections 
  # has_many :rewards, :through => :users, :foreign_key => ""

  def pointSum(pointKind)
    mark = Mark.find_by_user_id_and_pointKind_id(self, pointKind)
    mark == nil ? 0 : mark.pointSum
  end

  def collect(reward)
    if reward.available? and
        pointSum(reward.pointKind) >= reward.priceInPoints
      newReward = RewardCollection.new
      newReward.winner = self
      newReward.reward = reward
      reward_collections << newReward
    end
  end


end
