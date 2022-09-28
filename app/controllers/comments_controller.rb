class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.post = post
    if comment.save
      redirect_to user_post_path(current_user, comment)
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
