class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    @comment.tweed_id = params[:tweed_id]
    @comment.save
    redirect_to tweed_path @comment.tweed
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
