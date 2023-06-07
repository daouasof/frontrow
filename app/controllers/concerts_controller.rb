require 'open-uri'
require 'nokogiri'

class ConcertsController < ApplicationController
  def index
    #it wont be concert.all - it will be based on whatever the user has search
    @concerts = Concert.all
    if params[:query].present?
      @concerts = Concert.search_by_city(params[:query])
    end
  end
end

def show
  @concert = Concert.find(params[:id])
end
