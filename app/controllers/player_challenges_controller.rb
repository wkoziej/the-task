class PlayerChallengesController < ApplicationController
  # GET /player_challenges
  # GET /player_challenges.json
  def index
    @player_challenges = PlayerChallenge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @player_challenges }
    end
  end

  # GET /player_challenges/1
  # GET /player_challenges/1.json
  def show
    @player_challenge = PlayerChallenge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @player_challenge }
    end
  end

  # GET /player_challenges/new
  # GET /player_challenges/new.json
  def new
    @player_challenge = PlayerChallenge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @player_challenge }
    end
  end

  # GET /player_challenges/1/edit
  def edit
    @player_challenge = PlayerChallenge.find(params[:id])
  end

  # POST /player_challenges
  # POST /player_challenges.json
  def create
    @player_challenge = PlayerChallenge.new(params[:player_challenge])

    respond_to do |format|
      if @player_challenge.save
        format.html { redirect_to @player_challenge, :notice => 'Player challenge was successfully created.' }
        format.json { render :json => @player_challenge, :status => :created, :location => @player_challenge }
      else
        format.html { render :action => "new" }
        format.json { render :json => @player_challenge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /player_challenges/1
  # PUT /player_challenges/1.json
  def update
    @player_challenge = PlayerChallenge.find(params[:id])

    respond_to do |format|
      if @player_challenge.update_attributes(params[:player_challenge])
        format.html { redirect_to @player_challenge, :notice => 'Player challenge was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @player_challenge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /player_challenges/1
  # DELETE /player_challenges/1.json
  def destroy
    @player_challenge = PlayerChallenge.find(params[:id])
    @player_challenge.destroy

    respond_to do |format|
      format.html { redirect_to player_challenges_url }
      format.json { head :ok }
    end
  end
end
