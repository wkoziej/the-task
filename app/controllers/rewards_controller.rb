class RewardsController < ApplicationController
  # GET /rewards
  # GET /rewards.json
  def index
    @rewards = Reward.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @rewards }
    end
  end

  # GET /rewards/1
  # GET /rewards/1.json
  def show
    @reward = Reward.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @reward }
    end
  end

  # GET /rewards/new
  # GET /rewards/new.json
  def new
    @reward = Reward.new
    @point_kinds = PointKind.all.collect {|p| [p.name, p.id] }
    @users = User.all.collect {|p| [p.login, p.id] }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @reward }
    end
  end

  # GET /rewards/1/edit
  def edit
    @reward = Reward.find(params[:id])
    @point_kinds = PointKind.all.collect {|p| [p.name, p.id] }
    @users = User.all.collect {|p| [p.login, p.id] }

  end

  # POST /rewards
  # POST /rewards.json
  def create
    @reward = Reward.new(params[:reward])
    @reward.creator = current_user
    respond_to do |format|
      if @reward.save
        format.html { redirect_to @reward, :notice => 'Reward was successfully created.' }
        format.json { render :json => @reward, :status => :created, :location => @reward }
      else
        @point_kinds = PointKind.all.collect {|p| [p.name, p.id] }
        @users = User.all.collect {|p| [p.login, p.id] }
        format.html { render :action => "new" }
        format.json { render :json => @reward.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rewards/1
  # PUT /rewards/1.json
  def update
    @reward = Reward.find(params[:id])

    respond_to do |format|
      if @reward.update_attributes(params[:reward])
        format.html { redirect_to @reward, :notice => 'Reward was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @reward.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards/1
  # DELETE /rewards/1.json
  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy

    respond_to do |format|
      format.html { redirect_to rewards_url }
      format.json { head :ok }
    end
  end

  # GET /rewards/1/collect
  def collect
    @reward = Reward.find(params[:id])
    @user = current_user
    respond_to do |format|
      if @user.collect(@reward)
        format.html { redirect_to @reward, :notice => 'Reward was successfully collected.' }
        format.json { head :ok }
      else
        logger.debug @user.errors.full_messages
        format.html { redirect_to @user, :notice => 'Cant collect reward.' }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
