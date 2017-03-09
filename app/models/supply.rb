class Supply < ApplicationRecord
	has_many :project_supplies
	has_many :projects, through: :project_supplies
	
end
