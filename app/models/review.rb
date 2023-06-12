class Review < ApplicationRecord
  acts_as_favoritable

  has_many_attached :photos

  belongs_to :attendance
  has_many :comments
  delegate :concert, to: :attendance

  has_one :user, through: :attendance
  has_one :concert, through: :attendance
  has_one :artist, through: :concert

  validates :rating, presence: true
  validates :content, presence: true
end
