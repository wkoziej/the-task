class ChallengesController < ApplicationController
  
  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.find_all_by_game_id(params[:game_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @challenges }
    end
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
    @challenge = Challenge.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @challenge }
    end
  end

  def type_change
    @challenge = get_challenge(params) 
    @game = Game.find(params[:game_id])
    @challenge.game = @game
  end

  # GET /challenges/new
  # GET /challenges/new.json
  def new
    @challenge = get_challenge(params) 
    @game = Game.find(params[:game_id])
    @challenge.game = @game
    respond_to do |format|
      format.html 
      format.json { render :json => @challenge }
      format.js 
    end
  end

  # GET /challenges/1/edit
  def edit
    @challenge = Challenge.find(params[:id])
    @game = Game.find(params[:game_id])
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = get_challenge(params) 
    @game = Game.find(params[:game_id])
    @challenge.game = @game
    respond_to do |format|
      if  @challenge.update_attributes(params[:challenge]) and  @challenge.save
        format.html { redirect_to game_challenge_url(params[:game_id], @challenge.id), :notice => 'Challenge was successfully created.' }
        format.json { render :json => @challenge, :status => :created, :location => @challenge }
      else
        format.html { render :action => "new" }
        format.json { render :json => @challenge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /challenges/1
  # PUT /challenges/1.json
  def update
    @challenge = Challenge.find(params[:id])
    respond_to do |format|
      if @challenge.update_attributes(params[:challenge])
        format.html { redirect_to game_challenge_url(params[:game_id], @challenge.id), :notice => 'Challenge was successfully updated.' }
        format.json { head :ok }
      else
        # logger.debug @challenge.errors.messages
        format.html { render :action => "edit" }
        format.json { render :json => @challenge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to game_url(params[:game_id]) }
      format.json { head :ok }
    end
  end
  
  def get_challenge(params)
    @object_name = ""
    if params[:challenge] and params[:challenge][:type]
      @object_name = params[:challenge][:type].to_s + ".new"
    end
    if (@object_name.to_s.length > 4)
      @challenge = eval(@object_name)
    else
      @challenge = Challenge.new 
    end
  end

end
