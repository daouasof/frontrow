class ChatroomsController < ApplicationController
  def show
    raise
    @chatrooms = Chatroom.find(paramas[:id])
    @message = Message.new
  end
end
