class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @chatrooms = Chatroom.get_chatrooms(current_user)
    @chatrooms.each do |chatroom|
    @messages = []
    if chatroom.messages == []
      chatroom.destroy
    # elsif chatroom.empty?
    #   render :index
    else
      last_message = chatroom.messages.last
      @messages << last_message
    end
    raise
    @messages.sort_by(&:created_at).reverse
    end
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
