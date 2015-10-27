class PostsController < ApplicationController
	def index
		@posts = Post.where(user_id:params[:user_id])
	end


	def new 
		@user = current_user
	end

	def show
		
		# params = {"user_id"=>"1", "id"=>"1"}
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(params[:post])
		@post.user_id = current_user.id
		if @post.save
		flash[:notice] = "Post was saved."
		else
		flash[:alert] = "Post was not saved."
		end
		redirect_to root_path

	end
end
