class Concert < ApplicationRecord
  belongs_to :artist
  has_many :attendances
  has_many :users, through: :attendances
  has_many :reviews, through: :attendances
  validates :venue, presence: true
  validates :city, presence: true
  validates :date, presence: true
end
