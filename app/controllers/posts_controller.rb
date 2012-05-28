class PostsController < ApplicationController
  include UsersHelper
  def new
    @current_user = current_user
    ap "In PostsController#new: " + current_user.to_s
    ap "Nickname: " + @current_user.nickname
    @posts = Post.all
    @post = Post.new
  end

  def create
    ap "begin post create"
    @post = Post.new(params[:post])
    ap @post
    @post.save
  #render 'new'
  ap "PostsController#create"
    redirect_to new_post_path 

  end

end
