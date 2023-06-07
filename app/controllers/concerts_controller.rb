require 'open-uri'
require 'nokogiri'

class ConcertsController < ApplicationController
  def index
    #it wont be concert.all - it will be based on whatever the user has search
    @concerts = Concert.all
  end
end

def show
  @concert = Concert.find(params[:id])
end
