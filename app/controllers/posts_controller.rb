class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).where(user_id: params[:user_id]).references(:posts)
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.includes(:user).find(params[:id])
    @comments = @post.comments.includes(:user)
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    post = Post.new(params[:post].permit(:title, :text, :user_id))
    post.user = current_user

    if post.save
      flash[:notice] = 'Post was created successfully.'
      redirect_to user_posts_path(current_user, post)
    else
      flash.now[:error] = 'Post was not created.'
      render :show
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:notice] = 'Post was deleted successfully.'
      redirect_to user_posts_path(post.user)
    else
      flash.now[:error] = 'Post was not deleted.'
      render :show
    end
  end
end
