class Artist < ApplicationRecord
  has_many :concerts
  validates :name, presence: true
end
