module Api
  module V1
    class ApplicationController < ActionController::Base
      skip_before_action :verify_authenticity_token

      def authenticate_user_token
        user = User.find_by(authentication_token: request.headers["Authorization"])
        return render(json: { message: 'invalid token' }, status: 401) if user.nil?

        # store false would not store user session
        sign_in(user, store: false)
      end
    end
  end
end