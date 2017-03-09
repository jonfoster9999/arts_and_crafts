class StaticController < ApplicationController
	def welcome
		if logged_in?
			redirect_to current_user
		end
	end
end