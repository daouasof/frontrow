class Concert < ApplicationRecord
  belongs_to :artist
  has_many :attendances
end
