class CommentsController < ApplicationController

  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

    # @comment = Comment.create(message: params[:message], post_id: params[:post.id], user_id: current_user.id)
    # redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, post_id: params[:post_id])
  end



end

