class ChatController < ApplicationController
  require 'awesome_print'
  def new
    puts "In chatController NEW"
    @nickname = session[:tmp_nickname]
    ##TODO: This is where we could read older chat messages from file
    @message_list = session[:tmp_message_list]
    @message_list ||= "making the message not nil the first time"
  end
  
  def create
    @message = params[:message]
    @message_list = params[:message_list]
    
    @message_list = @message_list << " | " + @message
    ap @message_list
    
    ##TODO: This is where we could write the message to a file
    ##session[:tmp_message] = "a testmessage in the create action"  ##params[:nickname]
    session[:tmp_message_list] = @message_list
    redirect_to chat_path
  end
end