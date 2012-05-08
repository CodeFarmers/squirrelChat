class ChatController < ApplicationController
  require 'awesome_print'
  def new
    puts "In chatController NEW"
    @nickname = session[:tmp_nickname]
    ##TODO: This is where we could read older chat messages from file
    @message_list = session[:tmp_message_list]
    @message_list ||= "making the message not nil the first time"
    ap "right before if statement"
    @lines
    if File.exist?("log/chat.log")
      ap "File exists"
      ##logfile = File.new("log/chat.log")
     f = File.open("log/chat.log")
      @lines = f.readlines
      
    else
      ap "File does not exist"
      chatlog = File.new("log/chat.log", "w")
      chatlog.close
    end
  end
  
  def create
    @message = params[:message]
    @message_list = params[:message_list]
    
    @message_list = @message_list << " | " + @message
    
    
    ##TODO: This is where we could write the message to a file
    open("log/chat.log", 'a') do |f|
    f << @message + "\n"
    end
    
    
    session[:tmp_message_list] = @message_list
    redirect_to chat_path
  end
end