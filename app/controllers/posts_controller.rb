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
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    set_post
  end

  def update
    set_post
    if @post.update(post_params)
      redirect_to user_path(current_user.id), notice: "投稿を編集しました。"
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    set_post
    if @post.destroy
      redirect_to user_path(current_user.id),notice: "投稿を削除しました。"
    else
      flash.now[:alert] = "削除に失敗しました。"
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:start_at, :end_at, :marriage, :child, :childcare, :care, :employment_status, :content).merge(user_id: current_user.id)
  end
  private
  def set_post
    @post = Post.find(params[:id])
  end
end
