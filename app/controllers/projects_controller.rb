class ProjectsController < ApplicationController
	before_action :check_logged_in

	def new
		@user = User.find(params[:user_id])
		@project = @user.projects.build
		10.times do
			@project.supplies.build
		end
	end

	def edit
			@user = User.find(params[:user_id])
			@project = Project.find(params[:id])
		if @project.user == current_user
			10.times do
				@project.supplies.build
			end
		else
			flash[:alert] = "You are not authorized to perform this operation."
			redirect_to user_project_path(@user, @project)
		end
	end

	def show
		@user = User.find(params[:user_id])
		@project = Project.find(params[:id])
		@review = Review.new

		if @project.user != @user
			render :error
		end
		respond_to do |format|
			format.html {render :show}
			format.json {render json: @project}
		end
	end


	def create
		@user = User.find(params[:user_id])
		@project = @user.projects.build(project_params)
		if @project.valid?
			@project.user = @user
			@project.save
			redirect_to home_path
		else
			flash[:notice] = "Projects must have a title and a description"
			redirect_to new_user_project_path
		end
	end

	def update
		@user = User.find(params[:user_id])
		@project = Project.find(params[:id])
		@project.update(project_params)
		redirect_to user_project_path(@user, @project)
	end

	def destroy
		project = Project.find(params[:id])
		if project.user = current_user
			Review.where(:project_id => project.id).destroy_all
			project.destroy
			redirect_to home_path
		else
			flash[:notice] = "You are not authorized to perform this operation"
			redirect_to user_project_path(project.user, project)
		end
	end

	def projects
		@obj = {}
		@projects = Project.all
		@obj[:projects] = @projects
		@obj[:current_id] = current_user.id
		render json: @obj
	end

	private

	def project_params
		params.require(:project).permit(:title, :description, :supply_ids => [], :supplies_attributes => [:title, :price])
	end
end
