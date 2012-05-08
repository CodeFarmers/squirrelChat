class ChatController < ApplicationController
  def new
    puts "In chatController NEW"
    @nickname = session[:tmp_nickname]
    ##TODO: This is where we could read older chat messages from file
    @message = session[:tmp_message]
    @message ||= "making the message not nil the first time"
  end
  
  def create
    @message = params[:message]
    
    ##TODO: This is where we could write the message to a file
    session[:tmp_message] = "a testmessage in the create action"  ##params[:nickname]
    
    redirect_to chat_path
  end
end