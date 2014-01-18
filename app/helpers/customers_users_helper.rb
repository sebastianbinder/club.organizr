module CustomersUsersHelper
	def all_email_addresses
		emails = []
		@customers_users.each do |user|
			unless (user.email == current_user.email)
				emails << user.email
			end
		end
		return emails.join(', ')
	end
	
	def organizers_email_addresses
		emails = []
		@customers_users_self.where(:role => "organizer").each do |user|
			unless (user.user.email == current_user.email)
				emails << user.user.email
			end
		end
		@customers_users_self.where(:role => "customer").each do |user|
			unless (user.user.email == current_user.email)
				emails << user.user.email
			end
		end
		return emails.join(', ')
	end
end
