class User < ApplicationRecord
  has_one_attached :avatar
  has_one_attached :banner

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendances
  has_many :reviews, through: :attendances
  has_many :concerts, through: :attendances

  acts_as_followable
  acts_as_follower

  def follow
    @current_user.follow(@user)
    @follow = Follow.find_by(follower: @current_user, followable: @user)
  end

  def unfollow
    @current_user.stop_following(@user)
  end

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
