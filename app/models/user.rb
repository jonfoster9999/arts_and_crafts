class User < ApplicationRecord
	has_secure_password
	has_many :projects
	has_many :reviews, through: :projects
	
	validates :email, presence: true

	def self.from_omniauth(auth)
		  	where(uid: auth.uid).first_or_create do |user|
		    user.uid      = auth.uid
		    user.name     = auth.info.name
		    user.email    = auth.info.email
		    user.password = SecureRandom.hex
		    user.save
		    user
  		end
	end
end
