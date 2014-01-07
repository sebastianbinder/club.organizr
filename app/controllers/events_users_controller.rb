class EventsUsersController < ApplicationController
	
	before_filter :authenticate_user!
	load_and_authorize_resource
	
	def update
		@event_user = EventsUser.find(params[:id])
		if @event_user.update("status" => params[:status])
			redirect_to customer_events_path
		else
			render 'edit'
		end
	end
	
	def destroy
		@event_user = EventsUser.find(params[:id])
		@event_user.destroy
 
		redirect_to customer_events_path
	end
	
	private

end
