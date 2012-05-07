class ChatController < ApplicationController
  def new
    puts "In chatController NEW"
    @nickname = session[:tmp_nickname]
    ##TODO: This is where we could read older chat messages from file
    @message = "This is a hard-coded test message"
  end
  
  def create
    @message = params[:message]
    ##TODO: This is where we could write the message to a file
    
    redirect_to chat_path
  end
end