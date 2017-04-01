module UsersHelper
	
	def reset_notifications(user)
		user.notifications = false
		user.save
	end
end
