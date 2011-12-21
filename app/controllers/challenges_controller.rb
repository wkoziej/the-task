class ChallengesController < ApplicationController
  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all

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

  # GET /challenges/new
  # GET /challenges/new.json
  def new
    @challenge = Challenge.new 
    @game = Game.find(params[:game_id])
    @pointKinds = PointKind.all.collect {|p| [p.name, p.id] }
    # TODO !!!
    @challengeTypes = challengeTypeArray
    respond_to do |format|
      format.html 
      format.json { render :json => @challenge }
    end
  end

  # GET /challenges/1/edit
  def edit
    @challenge = Challenge.find(params[:id])
    @game = Game.find(params[:game_id])
    @pointKinds = PointKind.all.collect {|p| [p.name, p.id] }
    @challengeTypes = challengeTypeArray 
  end

  # POST /challenges
  # POST /challenges.json
  def create
    # TODO !!!
    @object_name = params[:challenge][:type].to_s + ".new"
    logger.debug(@object_name)
    @challenge = eval(@object_name)
    @game = Game.find(params[:game_id])
    @challenge.game = @game
    respond_to do |format|
      if @challenge != nil and @challenge.update_attributes(params[:challenge]) and @challenge.save
        format.html { redirect_to game_challenge_url(params[:game_id], @challenge.id), :notice => 'Challenge was successfully created.' }
        format.json { render :json => @challenge, :status => :created, :location => @challenge }
      else
        @pointKinds = PointKind.all.collect {|p| [p.name, p.id] }
        @challengeTypes = challengeTypeArray
        logger.debug(@challenge.errors.full_messages)
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
      format.html { redirect_to game_challenges_url(params[:game_id]) }
      format.json { head :ok }
    end
  end
  
  def challengeTypeArray
    [["Enter Message", "EnterMessage" ], ["Capture Code", "CaptureCode"]]
  end

end
