class ReviewsController < ApplicationController
	def create 
		@review = Review.create(review_params)
		redirect_to user_project_path(@review.project.user, @review.project)
	end


	private

	def review_params
		params.require(:review).permit(:author_id, :project_id, :content, :rating)

	end
end
