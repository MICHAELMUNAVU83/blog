class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = params[:user_id]
    if @post.save
      redirect_to user_posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:text, :title, :user_id)
  end
end
