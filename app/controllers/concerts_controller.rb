require 'open-uri'
require 'nokogiri'

class ConcertsController < ApplicationController
  def index
    #it wont be concert.all - it will be based on whatever the user has search
    @city = params[:query_city]
    @artist = params[:query_artist]

    @concerts = Concert.all
    @concerts = Concert.search_by_city(@city) if @city.present?
    @concerts = Concert.search_by_artist(@artist) if @artist.present?
    @concerts = Concert.search_by_artist(@artist).search_by_city(@city) if @artist.present? && @city.present?
  end
end

def show
  @concert = Concert.find(params[:id])
end
