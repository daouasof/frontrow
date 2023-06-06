class ConcertsController < ApplicationController
  def index
  end
end

def show
  @concert = Concert.find(params[:id])
end
