require 'open-uri'
require 'nokogiri'

class ConcertsController < ApplicationController
  def index
    @concerts = Concert.all
  end

  def show
    @concert = Concert.find(params[:id])
    @review = Review.new
  end
end
