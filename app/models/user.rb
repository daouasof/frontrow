class User < ApplicationRecord
  has_one_attached :photo
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendances
  has_many :reviews, through: :attendances
  has_many :concerts, through: :attendances

  def attended?(concert)
    !find_attendance(concert).nil?
  end

  def attendance_info(concert)
    find_attendance(concert)
  end

  private

  def find_attendance(concert)
    Attendance.find_by(concert: concert, user: self)
  end
end
