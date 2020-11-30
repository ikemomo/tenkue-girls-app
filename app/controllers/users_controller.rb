class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = @user.posts.last
    @posts = @user.posts.order("created_at DESC")
  end

  def follow
    @user = User.find(params[:id])
    @followings = @user.followings.order
  end
end
