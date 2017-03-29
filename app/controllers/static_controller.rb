class StaticController < ApplicationController
	before_action :check_logged_in
	skip_before_action :check_logged_in, only: [:welcome]
	
	def welcome
		if logged_in?
			redirect_to "/home"
		end
	end

	def home
		@user = current_user
		@projects = Project.all
		@users = User.all
	end

	def top_rated
		@top_projects = Project.top_rated_projects
	end

	def low_cost
		@low_cost_projects = Project.low_cost_projects
	end

	def about
		
	end
end