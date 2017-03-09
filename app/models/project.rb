class Project < ApplicationRecord
	has_many :project_supplies
	has_many :supplies, through: :project_supplies
	belongs_to :user
	has_many :awards
	
end
