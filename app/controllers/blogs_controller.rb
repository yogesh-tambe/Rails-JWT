class BlogsController < ApplicationController
	skip_before_action :verify_authenticity_token, raise: false
	def index
		render json: @blogs = Blog.all
	end

	def show
		@blog = Blog.find(params[:id])
		render json: @blog
  end

  def create
		@blog = Blog.new(blog_params)
		if(@blog.save)
			render json: @blog, status: :created, location: @blog
		else
			render json: @blog.errors, status: :unprocessable_entity
		end
	end

	def update
		@blog = Blog.find(params[:id])
		if(@blog.update(blog_params))
			render json: @blog
		else
			render json: @blog.errors, status: :unprocessable_entity
		end
	end

  def destroy
  	@blog = Blog.find(params[:id])
  	@blog.destroy
  	render json: {status: 204}
	end

	private
		def blog_params
    	params.require(:blog).permit(:title, :short_desc, :author)
  	end
end