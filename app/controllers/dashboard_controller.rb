class DashboardController < ApplicationController
  def index
    @games = Game.find(:all, :order => " created_at DESC ", :limit => 3 )
    @rewards = Reward.find(:all, :order => " created_at DESC ", :limit => 3 )
  end

end
