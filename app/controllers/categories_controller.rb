class CategoriesController < ApplicationController
	def index
		render json: @categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
		render json: @category
  end
end