class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    @session = params[:session]
    puts @session
    redirect_to chat_path
  end

  def destroy
  end

end
