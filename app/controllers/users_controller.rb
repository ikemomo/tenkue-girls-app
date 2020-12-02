class UsersController < ApplicationController
  before_action :set_user, only: [:show, :follow, :follower]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result.includes(distinct: true)
  end

  def show
    @post = @user.posts.last
    @posts = @user.posts.order("created_at DESC")
  end

  def follow
    @followings = @user.followings.order("created_at DESC")
  end

  def follower
    @followers = @user.followers.order("created_at DESC")
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
