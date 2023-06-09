class Comment < ApplicationRecord
  acts_as_favoritable

  belongs_to :user
  belongs_to :review
  validates :content, presence: true
end
