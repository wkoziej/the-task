module ChallengesHelper

  def get_point_kinds 
    PointKind.all.collect {|p| [p.name, p.id] }
  end
  
  def get_challenge_types
    @options = [  [t(:enter_message), "EnterMessage" ], 
                  [t(:capture_code),  "CaptureCode"] ,
                  [t(:confirm_position),  "ConfirmPosition"] 
               ];
    if params[:id] == nil 
      @options = [[t(:choose_challenge), "" ]].concat(@options);
    end
    @options
  end

end
