class ProjectsController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@project = @user.projects.build
		20.times do
			@project.supplies.build
		end

	end

	def index

	end

	def show
		@user = User.find(params[:user_id])
		@project = Project.find(params[:id])
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


	private

	def project_params
		params.require(:project).permit(:title, :description, :supply_ids => [], :supplies_attributes => [:title, :price])
	end
end
