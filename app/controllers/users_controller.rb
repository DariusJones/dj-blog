class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		puts "@@@@@@@ ARE PARAMS@@@@@"
		puts params
		# {"utf8"=>"✓", "authenticity_token"=>"63/ZpFAfjZy6f0ne6Gh47fz4lC//yYaNA1Qo2l1nx4M+npM8oir3tVU2b5YgbY5u1kky13LYrWrWJnbmQxpkVg==", "user"=>{"username"=>"Soxs28@aol.com", "password"=>"password"}, "commit"=>"Create User", "controller"=>"users", "action"=>"create"}
		# Create a new user instance 
		@user = User.new(params[:user])
		# Check if the instance was save successfully in the db
		if @user.save
			# if it was, alert the user it was
			flash[:notice] = "Users was created"
		else
			#if not, tell them it wasn't
			flash[:alert] = "User was a problem saving"
		end
		redirect_to root_path
		 
		
		#redirect them somewhere
	end

end
