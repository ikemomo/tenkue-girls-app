class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post = Post.new
    @user = User.find(current_user.id)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_path(@post.user.id), notice: "投稿しました"
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:start_at, :end_at, :marriage, :child, :childcare, :care, :employment_status, :content).merge(user_id: current_user.id)
  end
end
