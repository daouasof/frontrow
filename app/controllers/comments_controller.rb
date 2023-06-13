class CommentsController < ApplicationController

  def create
    @comment = Comment.new(set_comment)
    @comment.user = current_user
    @comment.review = Review.find(params[:review_id])
    @comment.save



  end

  private

  def set_comment
    params.require(:comment).permit(:content)
  end

end
