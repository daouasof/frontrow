class Review < ApplicationRecord
  belongs_to :attendance
  has_one :user, through: :attendance
  has_one :concert, through: :attendance
  has_one :artist, through: :concert

  validates :rating, presence: true
  validates :content, presence: true
end
