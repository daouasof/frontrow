class ReviewsController < ApplicationController
  # before_action :set_concert, only: %i[new create]

  def create
    @review = Review.new(review_params)
    @concert = Concert.find(params[:concert_id])
    @review.attendance = current_user.attendance_info(@concert)
    if @review.save
      redirect_to concert_path(@concert)
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
