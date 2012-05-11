class ChatController < ApplicationController
  def new
    @nickname = session[:tmp_nickname] || "Anonymous"
    @@lines = ""
    
    if File.exist?("log/chat.log")
      f = File.open("log/chat.log")
      @@lines = f.readlines
    else
      chatlog = File.new("log/chat.log", "w")
      chatlog.close
    end
    
    @lines = @@lines
  end
  
  def create
    @message = params[:message]
    @nickname = params[:nickname]
    ##This opens the logfile and appends the current message
    open("log/chat.log", 'a') do |f|
      f << @nickname + " says: " +@message + "\n"
    end
    
    ##This redirects to the new action in this controller
    redirect_to chat_path
  end
end