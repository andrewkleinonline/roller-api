module Api
  module V1
    class RollsController < ActionController::API
      def index
        render json: Roll.all
      end

      def show
        if Roll.find_by(id: params[:id])
          render json: Roll.find(params[:id])
        else
          render json: {errors: "A Roll with that ID was not found."}.to_json, status: 404
        end
      end
    end
  end
end
