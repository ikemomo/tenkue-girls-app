class UsersController < ApplicationController
  before_action :set_user, only: [:show, :follow, :follower]

  def index
    @users = User.all
  end

  def show
    @post = @user.posts.last
    @posts = @user.posts.order("created_at DESC")
  end

  def follow
    @followings = @user.followings.order
  end

  def follower
    @followers = @user.followers.order
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
