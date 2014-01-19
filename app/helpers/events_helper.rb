module EventsHelper
	def get_event_user(event_id)
		@event_user = EventsUser.find_or_create_by(event_id: event_id, user_id: current_user.id)
		return @event_user
	end
	def get_event_user_status_link(event_id, status)
		@event_user = get_event_user(event_id)
		return customer_events_user_path(@customer, @event_user, :status => status)
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
		return EventsUser.where(:event_id => event_id)
	end
	
	def get_update_time(event_id, user_id)
		EventsUser.where(:event_id => event_id, :user_id => user_id).take.updated_at
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
