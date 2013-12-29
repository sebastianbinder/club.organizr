module EventsHelper
	def get_event_user_status(event_id)
		@Event_Users = EventUsers.find_or_create_by(event_id: event_id, user_id: current_user.id)
		return @Event_Users.status
	end
end
