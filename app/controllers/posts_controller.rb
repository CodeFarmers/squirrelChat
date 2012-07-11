class PostsController < ApplicationController
  include UsersHelper
  def new
    @current_user = current_user
    #@posts_with_nickname = Post.all.map { |p| { :content => p.content , :nickname => User.find(p.user_id).nickname } }
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    @post.save
    @posts = Post.all
    respond_to do |format|
      format.html { redirect_to new_post_path }
      format.js
    end
  end
end
