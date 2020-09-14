module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected
    def find_verified_user
      session_key = cookies.encrypted[Rails.application.config.session_options[:key]]
      verified_id = session_key['warden.user.user.key'][0][0]
      User.find_by(id: verified_id)
    end
  end
end
