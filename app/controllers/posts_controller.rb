class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	def index
		@posts = Post.where(user_id:params[:user_id])
	end

	def new 
		@post = Post.new
	end

	def show
		
		# params = {"user_id"=>"1", "id"=>"1"}
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(params[:post])
		@post.user_id = session[:user_id]
		if @post.save
		flash[:notice] = "Post was saved."
		else
		flash[:alert] = "Post was not saved."
		end
		redirect_to root_path

	end

	private
    
    def set_post
      @post = Post.find(params[:id])
    end

    
    def post_params
      params.require(:post).permit(:user_id, :body)
    end
end
