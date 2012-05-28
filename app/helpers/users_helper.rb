require 'awesome_print'
module UsersHelper
  
  def current_user
    # If the current user is not nil => return current user. If the current user is nil => look up the user id via the rails session (A built in session mechanism)
    ap "In current user getter: " 
    ap "Current user: " + @current_user.to_s
    ap "Session store: " + session[:user_id].to_s
    if @current_user
      ap "Current user nickname: " + @current_user.nickname.to_s
    end
    @current_user ||= User.find(session[:user_id])   
  end
  
  def store_user_for_session(user)
    ap "In UsersHelper#store_user_for_session: " + user.to_s
    session[:user_id] = user.id
  end
  
end
