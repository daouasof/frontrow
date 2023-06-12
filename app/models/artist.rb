class Artist < ApplicationRecord
  has_many :concerts
  validates :name, presence: true

  has_many_attached :photos
end
