class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @search = Chatroom.get_chatroom(current_user, @user)
    if @search.empty?
      @chatroom = Chatroom.create(participant1_id: current_user.id, participant2_id: @user.id)
    else
      @chatroom = @search.first
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to user_path(@user)
  end
end
