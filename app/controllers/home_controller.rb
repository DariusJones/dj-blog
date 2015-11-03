class HomeController < ApplicationController
	def homepage
		puts "User ID is "
		puts session[:user_id]
	end
end
