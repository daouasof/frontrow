class Concert < ApplicationRecord
  belongs_to :artist
  has_many :attendances
  has_many :users, through: :attendances
end
