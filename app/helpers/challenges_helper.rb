module ChallengesHelper

  def get_point_kinds 
    PointKind.all.collect {|p| [p.name, p.id] }
  end
  
  def get_challenge_types
    @options = Challenge::CHALLENGE_TYPES;
    if params[:id] == nil 
      @options = [[t(:choose_challenge), "" ]].concat(@options);
    end
    @options
  end

end
