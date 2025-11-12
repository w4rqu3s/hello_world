class RoomChannel < ApplicationCable::Channel
  def subscribed
    # espera `params[:room_id]` na assinatura
    room = Room.find_by(id: params[:room_id])
    if room
      stream_for room
    else
      reject
    end
  end

  def unsubscribed
    # nada a fazer — o stream para automaticamente
  end
end
