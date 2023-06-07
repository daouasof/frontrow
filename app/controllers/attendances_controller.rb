class AttendancesController < ApplicationController
  before_action :set_concert, only: :create
  before_action :set_user, only: :create
  # def new
  #   @attendance = Attendance.new
  # end

  def create
    @attendance = Attendance.new
    @attendance.user = @user
    @attendance.concert = @concert
    @attendance.save
    redirect_to concert_path(@concert)
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
    redirect_to concert_path(@attendance.concert)
  end

  private

  def set_user
    @user = current_user
  end

  def set_concert
    @concert = Concert.find(params[:concert_id])
  end


end
