class Award < ApplicationRecord
	belongs_to :project
	delegate :user, :to => :project, :allow_nil => true
end
