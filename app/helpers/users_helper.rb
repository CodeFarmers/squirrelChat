require 'awesome_print'
module UsersHelper
  
  def current_user
    # If the current user is not nil => return current user. If the current user is nil => look up the user id via the rails session (A built in session mechanism)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def store_user_for_session(user)
    session[:user_id] = user.id
  end
  
end
