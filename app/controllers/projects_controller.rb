class ProjectsController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@project = @user.projects.build
		20.times do
			@project.supplies.build
		end

	end


	def create

		@user = User.find(params[:user_id])
		@user.projects.create(project_params)

	end


	private

	def project_params
		params.require(:project).permit(:title, :description, :supply_ids => [], :supplies_attributes => [:title, :price])
	end
end
