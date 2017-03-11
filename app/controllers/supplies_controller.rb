class SuppliesController < ApplicationController
	def show
		@supply = Supply.find(params[:id])
	end
end
