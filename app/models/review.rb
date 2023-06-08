class Review < ApplicationRecord
  belongs_to :attendance
  has_one :user, through: :attendance

  validates :rating, presence: true
  validates :content, presence: true
end
