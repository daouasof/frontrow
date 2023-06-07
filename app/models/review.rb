class Review < ApplicationRecord
  belongs_to :attendance

  validates :rating, presence: true
  validates :content, presence: true
end
