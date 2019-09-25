class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to post_path(@comment.post_id)
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, post_id: params[:post_id])
  end


end

