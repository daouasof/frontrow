class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_user.present?
      @reviews = Review.all.reject { |review| review.user == current_user }
      if current_user.city.present?
        @concerts = Concert.where({ city: current_user.city }).order(date: :asc)
      end
    else
      @reviews = Review.all
      # @concerts = Concert.all
    end
  end
end
