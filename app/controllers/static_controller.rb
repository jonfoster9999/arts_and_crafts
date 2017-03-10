class StaticController < ApplicationController
	def welcome
		if logged_in?
			redirect_to current_user
		end
	end

	def home
		if !logged_in?
			redirect_to root_path
		end
		@user = current_user
		@projects = Project.all
		@users = User.all
	end

	def about

	end
end