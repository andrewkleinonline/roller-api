module Api
  module V1
    class RollsController < ActionController::API
      def index
        render json: Roll.all
      end

      def show
      end
    end
  end
end
