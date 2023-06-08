class Concert < ApplicationRecord
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_city,
    against: [ :city, :venue ],
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :search_by_artist,
    associated_against: {
      artist: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :artist
  has_many :attendances
  has_many :users, through: :attendances
  has_many :reviews, through: :attendances
  validates :venue, presence: true
  validates :city, presence: true
  validates :date, presence: true
end
