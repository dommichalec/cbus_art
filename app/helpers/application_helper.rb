# application helper module
module ApplicationHelper
  $SITE_NAME = 'Arch City Art'

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
