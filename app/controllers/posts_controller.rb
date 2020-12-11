class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_path(@post.user.id)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update
      redirect_to user_path(current_user.id), notice: "投稿を編集しました。"
    else
      flash.now[:alert] = "投稿編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
      redirect_to user_path(current_user.id),notice: "投稿を削除しました。"
  end

  private
  def post_params
    params.require(:post).permit(:start_at, :end_at, :marriage, :child, :childcare, :care, :employment_status, :content).merge(user_id: current_user.id)
  end
end
