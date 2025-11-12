class Message < ApplicationRecord
  belongs_to :room
  validates :user_name, :content, presence: true

  after_create_commit :broadcast_to_room

  private
  def broadcast_to_room
    RoomChannel.broadcast_to(room, {
      id: id,
      user_name: user_name,
      content: content,
      created_at: created_at.strftime("%H:%M:%S")
    })
  end
end
