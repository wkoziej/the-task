class EnteringMessagesController < PlayerChallengesController

  # GET /entering_messages/1
  # GET /entering_messages/1.json
  def show
    @entering_message = EnteringMessage.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @entering_message }
    end
  end

  # GET /entering_messages/1/edit
  def edit
    @entering_message = EnteringMessage.find(params[:id])
  end

  # PUT /entering_messages/1
  # PUT /entering_messages/1.json
  def update
    player_challenge_update(EnteringMessage, :entering_message)    
  end

end
