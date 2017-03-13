class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@reviews = @user.reviews
		@authored_reviews = @user.authored_reviews
	end
end
