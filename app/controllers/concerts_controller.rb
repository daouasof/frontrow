require 'open-uri'
require 'nokogiri'

class ConcertsController < ApplicationController
  def index
<<<<<<< HEAD
    @concerts = Concert.all
  end

  def show
    @concert = Concert.find(params[:id])
    @review = Review.new
=======
    #it wont be concert.all - it will be based on whatever the user has search
    @concerts = Concert.all
>>>>>>> master
  end
end
