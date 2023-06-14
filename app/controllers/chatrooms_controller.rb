class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @chatrooms = Chatroom.get_chatrooms(current_user)
    @messages = @chatrooms.map { |chat| chat.messages.last }.sort_by(&:created_at).reverse
  end
end
