class CapturingCodesController < ApplicationController
  # GET /capturing_codes
  # GET /capturing_codes.json
  def index
    @capturing_codes = CapturingCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @capturing_codes }
    end
  end

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
    @capturing_code = CapturingCode.find(params[:id])
    respond_to do |format|
      if @capturing_code.update_attributes(params[:capturing_code]) and @capturing_code.finish
        format.html { redirect_to play_path(@capturing_code.play), :notice => 'Capturing code was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @capturing_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /capturing_codes/1
  # DELETE /capturing_codes/1.json
  def destroy
    @capturing_code = CapturingCode.find(params[:id])
    @capturing_code.destroy

    respond_to do |format|
      format.html { redirect_to capturing_codes_url }
      format.json { head :ok }
    end
  end
end
