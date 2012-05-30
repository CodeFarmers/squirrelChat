class PostsController < ApplicationController
  include UsersHelper
  def new
    @current_user = current_user
    ap "In PostsController#new: " + current_user.to_s
    @posts_with_nickname = Post.all.map { |p| { :content => p.content , :nickname => User.find(p.user_id).nickname } }
    ap @posts_with_nickname
    @post = Post.new
  end

  def create
    ap "begin post create"
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    ap @post
    
    if @post.save
      ap "PostsController#create: successful save"
      redirect_to new_post_path  
    else
      ap "Failed save"
      render 'new'
    end
  #render 'new'
   

  end

end
