class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # will need to provide instances of reviews from users
    # that current_user follows for homepage
    @review = Review.last
  end
end
