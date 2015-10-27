class CommentsController < ApplicationController
	def create 
		@comment = Comment.new(params[:comment])
		@comment.user_id = session[:user_id]
		
		if @comment.save
			flash[:notice] = "great comment!"
		else
			flash[:alert] = "comment not saved correctly"
		end
		redirect_to :back
	end
end
