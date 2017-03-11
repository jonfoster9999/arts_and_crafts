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
		self.project_supplies = self.project_supplies.uniq
	end

	def short_description
		self.description.length > 60?
		self.description[0..60] + "..."
		:
		self.description
	end
end
