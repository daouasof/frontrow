class Concert < ApplicationRecord
  belongs_to :artist
  has_many :attendances
  has_many :users, through: :attendances
  validates :name, presence: true
  validates :city, presence: true
  validates :date, presence: true
end
