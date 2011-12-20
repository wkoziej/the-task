class RewardCollectionsController < ApplicationController
  # GET /reward_collections
  # GET /reward_collections.json
  def index
    @reward_collections = RewardCollection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @reward_collections }
    end
  end

  # GET /reward_collections/1
  # GET /reward_collections/1.json
  def show
    @reward_collection = RewardCollection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @reward_collection }
    end
  end

end
