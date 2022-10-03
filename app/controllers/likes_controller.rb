class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])

    like = Like.new(user: @user, post: @post)

    if like.save
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", notice: 'Success!'
    else
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", alert: 'Error occured!'
    end
  end
end
