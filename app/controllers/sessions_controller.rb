class SessionsController < ApplicationController
  def new
  end
  def create 
  	params[:username]
  	params[:password]
  	#find the user in the database
  	@user = User.where(username: params[:username]).first
  	
  	if @user
  		#check if pw is right
  		if @user.password == params[:password]
  			#if it is:
  			#setup a new session
  			session[:user_id]= @user.id
  			flash[:notice] = "You were logged in success"
  		else
  	
  		end
  		#if its not
  		#tell them its not
  		flash[:alert] = "your login is wrong"
  	
 	end
  	
  	
  	
  	
  	#redirect to another page
  end
  def destroy
  end
end
