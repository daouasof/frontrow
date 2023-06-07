class ReviewsController < ApplicationController
  # before_action :set_concert, only: %i[new create]

  def create
    raise
    @review = Review.new(review_params)
    # @review.concert = @concert
    @review.user = current_user
    if @review.save
      redirect_to concert_path(@review)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # def set_concert
  #   @concert = Concert.find(params[:concert_id])
  # end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
