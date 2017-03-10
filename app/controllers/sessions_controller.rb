class SessionsController < ApplicationController

	def new
		if logged_in?
			redirect_to home_path
		end
		@user = User.new
	end

	def create
		if request.env['omniauth.auth']
			@user = User.from_omniauth(auth)
			session[:user_id] = @user.id
			redirect_to home_path
		else
			@user = User.find_by(:email => params[:user][:email])
			if @user && @user.authenticate(params[:user][:password])
				session[:user_id] = @user.id
				redirect_to home_path
			else
				flash[:notice] = "Invalid email or password"
				redirect_to login_path
			end
		end
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