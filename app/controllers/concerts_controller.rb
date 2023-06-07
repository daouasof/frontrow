require 'open-uri'
require 'nokogiri'

class ConcertsController < ApplicationController

  def index

  end

  def show
    @concert = Concert.find(params[:id])
    @attendance = current_user.attendance_info(@concert)
  end
end
