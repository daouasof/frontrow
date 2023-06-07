class Concert < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_city,
    against: [ :city],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :artist
  has_many :attendances
  has_many :users, through: :attendances
  validates :venue, presence: true
  validates :city, presence: true
  validates :date, presence: true
end
