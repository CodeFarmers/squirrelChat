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
    
    if @user.save
      #handle successful save
      ap "In UsersController#create " + @user.nickname
      store_user_for_session(@user)
      redirect_to new_post_path
    else
      # If saving the user fails, show the new page again
      render '/users/new'
    end
    
  end
end
