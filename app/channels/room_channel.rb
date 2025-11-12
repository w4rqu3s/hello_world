class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find_by(id: params[:room_id])
    if room
      stream_for room
    else
      reject
    end
  end
end
