module Api
  module V1
    class TagsController < ActionController::API
      def show
        if Tag.find_by(id: params[:id])
          render json: Tag.find(params[:id])
        else
          render json: {errors: "A Tag with that ID was not found."}, status: 404
        end
      end


      def create
        tag = Tag.new(tag_params)
        if tag.save
          render json: tag, status: 200
        else
          render json: tag.errors, status: 400
        end
      end

      private

      def tag_params
        params.require(:tag).permit(:name)
      end
    end
  end
end
