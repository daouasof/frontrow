class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  def sender?(a_user)
    user.id == a_user.id
  end

  def find_other_user(a_user)
    if chatroom.participant1_id == a_user.id
      User.find(chatroom.participant2_id)
    else
      User.find(chatroom.participant1_id)
    end
  end
end
