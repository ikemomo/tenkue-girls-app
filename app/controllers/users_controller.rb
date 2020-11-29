class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = @user.posts.last
    @posts = @user.posts.order("created_at DESC")
  end
end
