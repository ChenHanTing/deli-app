module Api
  module V1
    class PingController < ApplicationController
      before_action :authenticate_user_token, only: :auth

      def show
        render json: { success: true }
      end

      def auth
        render json: { success: user_signed_in? }
      end
    end
  end
end
