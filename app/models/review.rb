class Review < ApplicationRecord
	belongs_to :project
	delegate :user, :to => :project, :allow_nil => true
	belongs_to :author, :class_name => "User"
end
