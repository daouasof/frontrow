require 'open-uri'
require 'nokogiri'

class ConcertsController < ApplicationController
  def index
    @concerts = Concert.all
  end

  def show
    @concert = Concert.find(params[:id])
    @attendance = current_user.attendance_info(@concert)
    @review = Review.new
  end
end
