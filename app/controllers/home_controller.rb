class HomeController < ApplicationController
	def homepage
		puts "User ID is "
		puts session[:user_id]
	end

	def current_user

		if session[:user_id]
			User.find(session[:user_id])
		else
			nil
		end

	end
end
