class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # will need to provide instances of reviews from users
    # that current_user follows for homepage
    if current_user.present?
      @reviews = Review.all.reject { |review| review.user == current_user }
    else
      @reviews = Review.all
    end
  end
end
