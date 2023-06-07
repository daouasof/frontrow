class ReviewsController < ApplicationController
  before_action :set_concert, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.attendance = current_user.attendance_info(@concert)
    if @review.save
      redirect_to concert_path(@concert)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_concert
    @concert = Concert.find(params[:concert_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
