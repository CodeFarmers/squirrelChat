class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    session[:tmp_nickname] = params[:nickname]
    ##puts "This is the nickname: " + @nickname
    redirect_to chat_path
  end

  def destroy
  end

end
