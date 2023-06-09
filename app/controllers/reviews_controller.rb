class ReviewsController < ApplicationController
  before_action :set_concert, only: [:new, :create]
  before_action :set_review, only: [:like, :unlike]

  def new
    @review = Review.new
    # @concert = Concert.find(params[:id])
    @attendance = current_user.attendance_info(@concert)
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

  def like
    current_user.favorite(@review)
    redirect_to concert_path(@review.concert)
  end

  def unlike
    current_user.unfavorite(@review)
    redirect_to concert_path(@review.concert)
  end

  private

  def set_concert
    @concert = Concert.find(params[:concert_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content, photos: [])
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
