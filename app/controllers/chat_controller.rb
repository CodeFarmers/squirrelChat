class ChatController < ApplicationController
  def new
    @nickname = session[:tmp_nickname] || "Anonymous" #Still wonder why this anonymous thing's not working
    @@lines = ""
    read_log_or_create_new
    
    
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
  
  def set_nickname
    session[:tmp_nickname] = params[:nickname]
    ## This redirects to the 'new' action in the chatController
    redirect_to chat_path  
  end
  
  def new_nickname
    #The root url in routes.rb is set to this action in this controller
    #Since no explicit render or redirect happens here, rails will try to render "new_nickname.html.erb" in "/app/views/chat/"
    #This is equivalent to explicitly typing "render 'new_nickname'"
  end
  
  private
    def read_log_or_create_new
        if File.exist?("log/chat.log")
        f = File.open("log/chat.log")
        @@lines = f.readlines
      else
        chatlog = File.new("log/chat.log", "w")
        chatlog.close
      end  
    end
end
  