class PostsController < ApplicationControllers
  
  def new
    @post = Post.new
  end

  def create
    # @post = Post.new(post_params)
    # if @post.save
    #   redirect_to user_path
    # else
    #   render :new
    # end
  end

  private
  def post_params
    params.require(:post).permit(:start_date, :end_date, :marriage, :child, :childcare, :care, :employment_status, :content).merge(user_id: current_user.id)
  end
end
