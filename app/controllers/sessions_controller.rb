class SessionsController < ApplicationController

	def create
		user = User.find_or_create_by(:email => auth['email']) do |u|
			u.name = auth['info']['name']
			u.password = SecureRandom.hex
		end
		session[:user_id] = user.id
		redirect_to user
	end

	private

	def auth
		request.env['omniauth.auth']
	end
end