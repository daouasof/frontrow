class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @review = Review.find(params[:review_id])
    @comment.review = @review
    @concert = @review.concert

    respond_to do |format|
      if @comment.save
        format.html { redirect_to concert_path(@concert) }
        format.json
      else
        format.html { render "concerts/show", status: :unprocessable_entity }
        format.json
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
