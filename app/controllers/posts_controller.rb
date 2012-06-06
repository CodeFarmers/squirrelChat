class PostsController < ApplicationController
  include UsersHelper
  def new
    @current_user = current_user
    @posts_with_nickname = Post.all.map { |p| { :content => p.content , :nickname => User.find(p.user_id).nickname } }
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    if @post.save
      redirect_to new_post_path  
    else
      render 'new'
    end
  end
end
