class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @chatrooms = Chatroom.get_chatrooms(current_user)
    @messages = []
    @chatrooms.each do |chatroom|
      if chatroom.messages.empty?
        chatroom.destroy
      else
        last_message = chatroom.messages.last
        @messages << last_message
      end
    end
    if @chatrooms.empty?
      render :index
    end
    @messages = @messages.sort_by(&:created_at).reverse

  end

  def set_or_create_chatroom
    @user = User.find(params[:user_id])
    @search = Chatroom.get_chatroom(current_user, @user)
    if @search.empty?
      @chatroom = Chatroom.create(participant1_id: current_user.id, participant2_id: @user.id)
    else
      @chatroom = @search.first
    end
    @message = Message.new
    render :show
  end

  def delete
    @chatroom.destroy
  end
end
