module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user_name

    def connect
      self.current_user_name = cookies.signed[:user_name] || "Guest-#{SecureRandom.hex(3)}"
    end
  end
end
