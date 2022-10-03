class UsersController < ApplicationController
  def index
    @users = User.includes(:posts, :comments, :likes)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
