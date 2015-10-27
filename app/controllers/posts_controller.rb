class PostsController < ApplicationController
	def index
		@posts = Post.all
	end


	def new 
		@user = current_user
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
