class ChatroomsController < ApplicationController
  def show
    # raise
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
