class UsersController < ApplicationController
  include UsersHelper
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.nickname == ""
      @user.nickname = "Anonymous"
    end
    
    if !User.exists?(:nickname => @user.nickname)
      @user.save
    else
      @user = User.find_by_nickname(@user.nickname)    
    end
      store_user_for_session(@user)
      redirect_to new_post_path 
    
    
  end
end
