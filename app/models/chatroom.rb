class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  scope :get_chatroom, -> (user_a, user_b) {
    where(participant1_id: user_a.id, participant2_id: user_b.id)
    .or(where(participant1_id: user_b.id, participant2_id: user_a.id))
  }
end
