class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @chatrooms = Chatroom.get_chatrooms(current_user)
    @chatrooms.each do |chatroom|
      if !chatroom.messages.empty?
        @messages = @chatrooms.map { |chat| chat.messages.last }.sort_by(&:created_at).reverse
      end
    end
  end

  # def unread
  #   last_message = Chatroom.messages.last_message
  #   if last_user_id.user_id == current_user.id
  #     @unread << last_message
  #   end
  # end

  # def read_or_unread
  #   @chatroom_index.each do |last_message|
  #     if last_message.messages.last.user_id == current_user.id
  #       @unread << last_message
  #     else
  #       @read << last_message
  #     end
  #   end
  # end
end
