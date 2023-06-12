class ChatroomsController < ApplicationController
  def show
    @chatrooms = Chatroom.find(paramas[:id])
    @message = Message.new
  end
end
