class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    session[:tmp_nickname] = params[:nickname]
    
    ## This redirects to the 'new' action in the chatController
    redirect_to chat_path
  end

  def destroy
  end

end
