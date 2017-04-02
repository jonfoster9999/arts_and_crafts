class ReviewsController < ApplicationController
	def create 
		@review = Review.create(review_params)
		@review.project.user.notifications = true
		@review.project.user.save
		render 'reviews/show', :layout => false
	end

	def destroy
		@review = Review.find(params[:id])
		project = @review.project
		@review.destroy
		redirect_to user_project_path(project.user, project)
	end

	private

	def review_params
		params.require(:review).permit(:author_id, :project_id, :content, :rating)

	end
end
