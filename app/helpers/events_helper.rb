module EventsHelper
	def get_event_user_status(event_id)
		@event_user = EventsUser.find_or_create_by(event_id: event_id, user_id: current_user.id)
		return @event_user.status
	end
end
