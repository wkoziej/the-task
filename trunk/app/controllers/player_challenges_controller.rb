# -*- coding: utf-8 -*-
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

  # GET /player_challenges/1/edit
  # GET /capturing_code/1/edit
  # GET /entering_message/1/edit
  # ...
  def edit
    @player_challenge = PlayerChallenge.find(params[:id])
  end

  # PUT /player_challenges/1
  # PUT /player_challenges/1.json
  def update
    player_challenge_update(PlayerChallenge, :player_challenge)
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
