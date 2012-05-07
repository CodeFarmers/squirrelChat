class ChatController < ApplicationController
  def new
    puts "In chatController"
    @nickname = session[:tmp_nickname]
    puts "The nickname in the chatController: " +  @nickname
  end
end