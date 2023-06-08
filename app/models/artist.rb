class Artist < ApplicationRecord
  has_many :concerts
  validates :name, presence: true

  has_one_attached :photo
end
