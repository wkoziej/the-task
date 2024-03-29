class PlaysController < ApplicationController
  # GET /plays
  # GET /plays.json
  def index
    @plays = Play.where(:status => "started").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @plays }
    end
  end

  # GET /plays/1
  # GET /plays/1.json
  def show
    @play = Play.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @play }
    end
  end

  # POST /plays
  # POST /plays.json
  def create
    @play = Play.new(params[:play])
    respond_to do |format|
      if @play.save
        format.html { redirect_to @play, :notice => 'Play was successfully created.' }
        format.json { render :json => @play, :status => :created, :location => @play }
      else
        # logger.debug @challenge.errors.messages
        format.html { render :action => "new" }
        format.json { render :json => @play.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plays/1
  # PUT /plays/1.json
  def update
    @play = Play.find(params[:id])

    respond_to do |format|
      if @play.update_attributes(params[:play])
        format.html { redirect_to @play, :notice => 'Play was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @play.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plays/1
  # DELETE /plays/1.json
  def destroy
    @play = Play.find(params[:id])
    @play.destroy

    respond_to do |format|
      format.html { redirect_to plays_url }
      format.json { head :ok }
    end
  end
end
