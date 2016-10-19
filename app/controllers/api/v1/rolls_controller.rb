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
          render json: {errors: "A Roll with that ID was not found."}, status: 404
        end
      end


      def create
        roll = Roll.new(roll_params)
        if roll.save
          render json: roll, status: 200
        else
          render json: roll.errors, status: 400
        end
      end

      private

      def roll_params
        params.require(:roll).permit(:title, :start_time, :end_time, :youtube_identifier)
      end
    end
  end
end
