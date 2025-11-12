class Message < ApplicationRecord
  belongs_to :room
  validates :user_name, :content, presence: true


end
