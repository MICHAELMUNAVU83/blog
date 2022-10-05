module Api
   
    module V1
        class CommentsController < ApplicationController
            def index
                @comments = Comment.all
                render json: @comments
            end
            def create
                @comment = Comment.new(comment_params)
                @comment.post_id = params[:post_id]
                @comment.user_id = current_user.id
                if @comment.save
                    render json: @comment
                else
                    render json: @comment.errors
                end
            end
            private
            def comment_params
                params.require(:comment).permit(:text)
            end
            end
        end
    end