class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @chatrooms = Chatroom.all
    @chatrooms_index = []
    @chatrooms.each do |chat|
      # if current_user.id == chat.participant1_id
      #   @other_user = User.find(chat.participant2_id)
      # else
      #   @other_user = User.find(chat.participant1_id)
      # end
      if current_user.id == chat.participant1_id || current_user.id == chat.participant2_id
        @chatrooms_index << chat
      end
    end
  end

  # def set_chat_user
  #   # @chat_current_user = current_user
  # end

end
