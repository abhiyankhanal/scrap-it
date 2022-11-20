class CategoryController < ApplicationController
    def index
        @categories = Category.all
      end
    
      def new
        @category = Category.new
      end
    
      def create
        @category = Category.new(category_params)
        if @category.save
          render json: {data: @category , status: 'success'}, status: :ok
        else
          render json: {data: @category.errors.full_messages , status: 'failure'},  status: :unprocessable_entity
        end
      end
    
      private
        def category_params
          params.require(:category).permit(:name)
        end
end
