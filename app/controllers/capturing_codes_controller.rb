class CapturingCodesController < PlayerChallengesController

  # GET /capturing_codes/1
  # GET /capturing_codes/1.json
  # def show
  #   @capturing_code = CapturingCode.find(params[:id])
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render :json => @capturing_code }
  #   end
  # end

  # GET /capturing_codes/1/edit
  def edit
    logger.debug("ZZZZZ!!!!!!!!!!" + @player_challenge.class.to_s)
    logger.debug("A!!!!!!!!!!" + @player_challenge.class.to_s)
    @player_challenge = CapturingCode.find(params[:id])

  end

  # PUT /capturing_codes/1
  # PUT /capturing_codes/1.json
  def update
    player_challenge_update(CapturingCode, :capturing_code)    
  end



  def player_challenge_update(class_name, param_name)
    @player_challenge = class_name.find(params[:id])    
    respond_to do |format|
      if @player_challenge.update_attributes(params[param_name]) and  @player_challenge.finish
        format.html { redirect_to play_path(@player_challenge.play), :notice => 'Player Challenge code was successfully updated.' }
        format.json { head :ok }
      else
        logger.debug @player_challenge.errors.messages
        format.html { render :action => "edit" }
        format.json { render :json => @player_challenge.errors, :status => :unprocessable_entity }
      end
    end
  end

end
