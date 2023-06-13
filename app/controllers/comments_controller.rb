class CommentsController < ApplicationController

  def create
    @comment = Comment.new(set_comment)
    @comment.user = current_user
    @review = Review.find(params[:review_id])
    @comment.review = @review
    @comment.save
    @concert = @comment.review.concert

    respond_to do |format|
      format.html { redirect_to concert_path(@concert) and return }
      format.text { render partial: "concerts/comment", locals: { comment: @comment, review: @review }, formats: [:html] }
    end
  end

  private

  def set_comment
    params.require(:comment).permit(:content)
  end
end
