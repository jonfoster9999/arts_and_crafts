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

	def top_rated
		if !logged_in?
			redirect_to root_path
		end
		@top_projects = Project.top_rated_projects
	end

	def low_cost
		if !logged_in?
			redirect_to root_path
		end
		@low_cost_projects = Project.low_cost_projects
	end

	def about
		if !logged_in?
			redirect_to root_path
		end

	end
end