module ApplicationHelper
  def is_active?(action)
    logger.debug (action);
    logger.debug ( params[:action]);
    "active" if params[:action] == action
  end
end
