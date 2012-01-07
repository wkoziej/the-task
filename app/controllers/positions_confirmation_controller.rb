class PositionsConfirmationController < PlayerChallengesController

  # GET /position_confirmations/1
  # GET /position_confirmations/1.json
  def show
    @position_confirmation = PositionConfirmation.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @position_confirmation }
    end
  end

  # GET /position_confirmations/1/edit
  def edit
    @position_confirmation = PositionConfirmation.find(params[:id])
  end

  # PUT /position_confirmations/1
  # PUT /position_confirmations/1.json
  def update
    player_challenge_update(PositionConfirmation, :position_confirmation)    
  end

end
