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

  # GET /reward_collections/new
  # GET /reward_collections/new.json
  def new
    @reward_collection = RewardCollection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @reward_collection }
    end
  end

  # GET /reward_collections/1/edit
  def edit
    @reward_collection = RewardCollection.find(params[:id])
  end

  # POST /reward_collections
  # POST /reward_collections.json
  def create
    @reward_collection = RewardCollection.new(params[:reward_collection])

    respond_to do |format|
      if @reward_collection.save
        format.html { redirect_to @reward_collection, :notice => 'Reward collection was successfully created.' }
        format.json { render :json => @reward_collection, :status => :created, :location => @reward_collection }
      else
        format.html { render :action => "new" }
        format.json { render :json => @reward_collection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reward_collections/1
  # PUT /reward_collections/1.json
  def update
    @reward_collection = RewardCollection.find(params[:id])

    respond_to do |format|
      if @reward_collection.update_attributes(params[:reward_collection])
        format.html { redirect_to @reward_collection, :notice => 'Reward collection was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @reward_collection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reward_collections/1
  # DELETE /reward_collections/1.json
  def destroy
    @reward_collection = RewardCollection.find(params[:id])
    @reward_collection.destroy

    respond_to do |format|
      format.html { redirect_to reward_collections_url }
      format.json { head :ok }
    end
  end
end
