class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.from_omniauth(auth)
		session[:user_id] = user.id
		redirect_to user
	end

	def destroy
		session.clear
		redirect_to root_path
	end

	private

	def auth
		request.env['omniauth.auth']
	end
end