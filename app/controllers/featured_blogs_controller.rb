class FeaturedBlogsController < ApplicationController
	def index
		render json: @featured_blogs = FeaturedBlog.all
	end

	def show
		@featured_blog = FeaturedBlog.find(params[:id])
		render json: @featured_blog
  	end
end