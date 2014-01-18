module EventsHelper
	def get_event_user_status(event_id)
		@event_user = EventsUser.find_or_create_by(event_id: event_id, user_id: current_user.id)
		return @event_user.status
	end
	def get_event_user_status_deny_link(event_id)
		@event_user = EventsUser.find_or_create_by(event_id: event_id, user_id: current_user.id)
			return customer_events_user_path(@customer, @event_user, :status => 0)
	end
	def get_event_user_status_accept_link(event_id)
		@event_user = EventsUser.find_or_create_by(event_id: event_id, user_id: current_user.id)
			return customer_events_user_path(@customer, @event_user, :status => 1)
	end
	def get_event_user_status_reset_link(event_id)
		@event_user = EventsUser.find_or_create_by(event_id: event_id, user_id: current_user.id)
			return customer_events_user_path(@customer, @event_user, :status => nil)
	end
	def get_event_ics_details(event_id)
		require 'htmlentities'
		coder = HTMLEntities.new
		event = Event.find(event_id)
		details = event.details
		details = coder.decode(details)
		logger.debug details
		details = details.gsub(/\<a.*href\=['"](.*)['"].*\>(.*)\<\/a\>/) do    
			$2 + " [" + $1 + "]"
		end
		details = details.gsub("<li>", '- ').gsub("</li>", '').gsub("<ul>\r\n", '').gsub("<ol>\r\n", '').gsub("</ul>\r\n", '').gsub("</ol>\r\n", '').gsub("\r\n", '\n')
		details = sanitize(details, tags: %w[])
	end
	def get_event_participants(event_id)
		@event_users_accepted = EventsUser.where(:event_id => event_id)
	end
	def get_customers_user(user_id, customer_id)
		user = User.where(id: user_id).take
		customers_user = CustomersUser.where(customer_id: customer_id, user_id: user.id).take
		if customers_user.nil?
			customers_user = CustomersUser.where(user_id: user.id).take
			return "#"
		else
			return customer_customers_user_path(@customer, customers_user)
		end
	end
end
