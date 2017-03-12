class Project < ApplicationRecord
	has_many :project_supplies
	has_many :supplies, through: :project_supplies
	belongs_to :user
	has_many :reviews
	accepts_nested_attributes_for :supplies

	validates :title, presence: true
	validates :description, presence: true


	def supplies_attributes=(attributes)
		attributes.each do |index, attribute_hash|
			if !attribute_hash[:title].blank? && !attribute_hash[:price].blank?
				supply = Supply.find_or_create_by(:title => attribute_hash[:title]) do |s|
					s.price = attribute_hash[:price]
				end
				if !self.supplies.include?(supply)
					self.project_supplies.build(:supply_id => supply.id)
				end
			end
		end	
	end

	def short_description
		self.description.length > 60? self.description[0..60] + "..." : self.description
	end

	def average_rating
		total = 0.00
		self.reviews.each do |review|
			total += review.rating.to_i
		end
		(total/self.reviews.count).round(1).nan? ? 0.0 : (total/self.reviews.count).round(1)
	end

	def self.top_rated_projects
		self.all.sort { |a, b| b.average_rating <=> a.average_rating }[0..4]
	end

	def total_price
		total = 0
		self.supplies.each do |supply|
			total += supply.price
		end
		total
	end

	def self.low_cost_projects
		self.all.select do |project|
			project if project.total_price < 30
		end
	end
end
