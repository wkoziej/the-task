class CapturingCodesController < PlayerChallengesController

  # GET /capturing_codes/1
  # GET /capturing_codes/1.json
  def show
    @capturing_code = CapturingCode.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @capturing_code }
    end
  end

  # GET /capturing_codes/1/edit
  def edit
    @capturing_code = CapturingCode.find(params[:id])
  end

  # PUT /capturing_codes/1
  # PUT /capturing_codes/1.json
  def update
    player_challenge_update(CapturingCode, :capturing_code)    
  end

end
