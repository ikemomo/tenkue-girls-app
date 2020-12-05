class UsersController < ApplicationController
  before_action :set_user, only: [:show, :follow, :follower]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @post = @user.posts.last
    @user.update(
      age: (Date.today.strftime('%Y%m%d').to_i - @user.birthday.strftime('%Y%m%d').to_i) / 10000,
      engineer_history: (Date.today.strftime('%Y%m%d').to_i - @user.engineer_start_at.strftime('%Y%m%d').to_i) / 10000,
      marriage: @post.marriage,
      childcare: @post.childcare,
      care: @post.care,
      employment_status: @post.employment_status
    )
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
