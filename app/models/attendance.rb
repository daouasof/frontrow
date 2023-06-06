class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :concert
  has_one :review
end
