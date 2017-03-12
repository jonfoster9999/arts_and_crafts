class SuppliesController < ApplicationController
	def show
		@supply = Supply.find(params[:id])
	end

	def edit
		@supply = Supply.find(params[:id])
	end

	def destroy
		@supply = Supply.find(params[:id])
		@supply.destroy
		redirect_to home_path
	end


	def update
		@supply = Supply.find(params[:id])
		@supply.update(supply_params)
		redirect_to supply_path(@supply)
	end

	def supply_params
		params.require(:supply).permit(:title, :price)
	end
end
