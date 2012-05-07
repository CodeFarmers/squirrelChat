class ChatController < ApplicationController
  def new
    puts "In chatController NEW"
    @nickname = session[:tmp_nickname]
    ##puts "The nickname in the chatController: " +  @nickname
  end
  
  def create
    render '/chat/new'
  end
end