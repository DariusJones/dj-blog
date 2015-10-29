class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def index
		@users = User.all
	end
	def edit
		respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to @user, notice: 'User was successfully updated.' }
	        format.json { render :show, status: :ok, location: @user }
	      else
	        format.html { render :edit }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end 
	end

	def destroy
	@user = User.find(params[:id])
	@user.destroy
	redirect_to :back
	flash[:notice] = "User was deleted correctly"
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
			redirect_to(users_path) and return
		else
			#if not, tell them it wasn't
			flash[:alert] = "User was a problem saving"
		end
		redirect_to root_path
		 
		
		#redirect them somewhere
	end
	

end
