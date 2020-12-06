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
    @post = Post.find_by(id: params[:id])
  end

  def update
    post = Post.find_by(id: params[:id])
    post.update(post_params)

    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.delete
  end

  private
  def post_params
    params.require(:post).permit(:start_at, :end_at, :marriage, :child, :childcare, :care, :employment_status, :content).merge(user_id: current_user.id)
  end
end
