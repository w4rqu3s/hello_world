class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      head :ok
    else
      render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
    end

    ActionCable.server.broadcast room,
      message: message.content,
      user: message.user_name
  end

  private

  def message_params
    params.require(:message).permit(:user_name, :content)
  end
end
