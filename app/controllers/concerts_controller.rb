class ConcertsController < ApplicationController

  def index

  end

  def show
    @concert = Concert.find(params[:id])
    @attendance = current_user.attendances
  end
end
