class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
    # raise

    if current_user.admin == true
      # raise
      # @my_chatrooms = @chatrooms.map { |chatroom| chatroom.pharmacy.user_id == current_user.id }
      @my_chatrooms = []
      @chatrooms.each do |chatroom|
        if chatroom.pharmacy.user_id == current_user.id
          chatroom.name = chatroom.user.email
          @my_chatrooms << chatroom
        end
      end
      # raise
    else
      # @my_chatrooms = @chatrooms.map { |chatroom| chatroom.user_id == current_user.id }
      @my_chatrooms = []
      @chatrooms.each do |chatroom|
        @my_chatrooms << chatroom if chatroom.user_id == current_user.id
      end
      # raise
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    if current_user.admin == true
      @chatroom.name = @chatroom.user.email
    else
      @chatroom.name = @chatroom.pharmacy.name
    end
  end
end
