class AttendancesController < ApplicationController
  before_action :set_concert, only: :create
  before_action :set_user, only: :create
  # def new
  #   @attendance = Attendance.new
  # end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      redirect_to concert_path(@concert)
    else
      render :concerts/show, status: 422
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
    redirect_to concert_path(@concert)
  end

  private

  def set_user
    @user = current_user
  end

  def set_concert
    @concert = Concert.find(params[:concert_id])
  end

  def attendance_params
    params.require(:attendance).permit(:user_id, :concert_id)
  end
end
