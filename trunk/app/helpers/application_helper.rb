module ApplicationHelper
  def is_active?(action, controller)
    logger.debug(action);
    logger.debug(params.to_s);
    "active" if params[:controller] == controller and ( action == '' or action == params[:action])
   end
end
