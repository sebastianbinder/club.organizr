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
	
	def get_user_emails(users)
	  emails = Array.new
    users.each do |user|
      emails << user.email
    end
    return emails
	end
	
	def get_attend_button(id)
	  link_to(get_event_user_status_link(id, 1), :method => :put, data: {confirm: t(".alerts.dont_you_want_to_attend")}) do
        bootstrap_button('success', 'ok-circle', size: 'sm')
    end
	end
	
	def get_attending_button(id)
	  link_to(get_event_user_status_link(id, 0), :method => :put, data: {confirm: t(".alerts.dont_you_want_to_attend")}) do
        bootstrap_button('success', 'ok-sign', size: 'sm')
    end
	end
	
	def get_not_attend_button(id)
	  link_to(get_event_user_status_link(id, 0), :method => :put, data: {confirm: t(".alerts.dont_you_want_to_attend")}) do
        bootstrap_button('danger', 'remove-circle', size: 'sm')
    end
	end
	
	def get_not_attending_button(id)
	  link_to(get_event_user_status_link(id, 1), :method => :put, data: {confirm: t(".alerts.dont_you_want_to_attend")}) do
        bootstrap_button('danger', 'remove-sign', size: 'sm')
    end
	end
	
	def get_admin_remove_button(id)
	  if can? :manage, :all
        link_to(get_event_user_status_link(id, nil), :method => :put, data: {confirm: t(".alerts.do_you_want_to_remove")}) do
           bootstrap_button('warning', 'remove-circle', size: 'sm')
        end
    end
	end
	
	def get_respond_buttons(id)
	  if get_event_user(id).status == 1
      get_attending_button(id) + ' ' + get_admin_remove_button(id)
    elsif get_event_user(id).status == 0
      get_admin_remove_button(id) + ' ' + get_not_attending_button(id)
    else
      get_attend_button(id) + ' ' + get_not_attend_button(id)
    end
	end
	
end
