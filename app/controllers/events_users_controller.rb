class EventsUsersController < ApplicationController
	
	before_filter :authenticate_user!
	before_filter :find_customer
	load_and_authorize_resource
	
	def update
		@event_user = EventsUser.find(params[:id])
		if @event_user.update("status" => params[:status])
			redirect_to customer_events_path(@customer)
		else
			render 'edit'
		end
	end
	
	def destroy
		@event_user = EventsUser.find(params[:id])
		@event_user.destroy
 
		redirect_to customer_events_path(@customer)
	end
	
	private
		def find_customer
			@customer = Customer.find(params[:customer_id])
		end
end
