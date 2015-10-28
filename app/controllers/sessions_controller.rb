class SessionsController < ApplicationController
  def new
  end
  def show
    
  end

  def create 
  	# params[:username]
  	# params[:password]
  	#find the user in the database
  	user = User.where(username: params[:username]).first
  	
  	if user
  		#check if pw is right
  		if user.password == params[:password]
  			#if it is:
  			#setup a new session
  			session[:user_id]= user.id
  			flash[:notice] = "You were logged in successfully."
  		else
  		#if its not
  		#tell them its not
  		flash[:alert] = "Your login information is wrong."
  		end
  	else
  		flash[:alert] = "Your login  information is wrong."
 	end
  	#redirect to another page
  	redirect_to root_path
  end

  def destroy
    session[:user_id] = nil 
    flash[:notice] = "You are signed out!"
    redirect_to root_path
  end
end
