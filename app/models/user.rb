class User < ApplicationRecord
  after_create :set_default_avatar

  acts_as_favoritor

  has_one_attached :avatar
  has_one_attached :banner

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendances
  has_many :reviews, through: :attendances
  has_many :concerts, through: :attendances

  acts_as_followable
  acts_as_follower

  def attended?(concert)
    !find_attendance(concert).nil?
  end

  def attendance_info(concert)
    find_attendance(concert)
  end

  def set_default_avatar
    default_avatar_url = "https://hips.hearstapps.com/hmg-prod/images/sigourney-weaver-avatar-ii-the-way-of-water-1670323174.jpg?crop=0.500xw:0.949xh;0.299xw,0.0514xh&resize=1200:*"
    default_banner_url = "https://townsquare.media/site/62/files/2021/11/attachment-brian-ruiz.jpg?w=980&q=75"

    avatar = URI.open(default_avatar_url)
    self.avatar.attach(io: avatar, filename: "avatar.png", content_type: "image/png")

    banner = URI.open(default_banner_url)
    self.banner.attach(io: banner, filename: "banner.png", content_type: "image/png")
  end

  private

  def find_attendance(concert)
    Attendance.find_by(concert: concert, user: self)
  end
end
