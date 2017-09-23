class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user_id = session[:user_id]
    chatroom = Chatroom.find(message.chatroom_id)

    if message.save
      redirect_to chatroom
    else
      redirect_to chatroom, flash[:notice] = {:notice => 'Error saving message'}
    end
  end

  private
    def message_params
      params.required(:message).permit(:text, :chatroom_id)
    end
end
