module Api
  module V1
    class AuthenticationController < ApplicationController
      before_action :authenticate_user_token, only: :logout

      def login
        if valid_user?
          render json: { message: 'ok', authentication_token: @user.authentication_token }, status: 200
        else
          render json: { message: 'invalid user email or password' }, status: 401
        end
      end

      def logout
        current_user.regenerate_auth_token
        render json: { message: 'you have been logged out' }, status: 200
      end

      private

      def valid_user?
        @user = User.find_by(email: params[:email])
        return false if @user.blank?

        @user.valid_password?(params[:password])
      end
    end
  end
end