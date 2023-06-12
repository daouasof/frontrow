class AddParticipantsToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :participant1_id, :integer
    add_column :chatrooms, :participant2_id, :integer
  end
end
