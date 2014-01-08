class EventsController < ApplicationController

	before_filter :authenticate_user!
	load_and_authorize_resource
	
	def index
		@customer = Customer.find(params[:customer_id])
		@events = Event.where(:customer_id => params[:customer_id]).sort_by &:date
		
	end
	
	def new
		@customer = Customer.find(params[:customer_id])
		@event = Event.new(:customer_id => params[:customer_id])
	end
	
	def create
		@customer = Customer.find(params[:customer_id])
		@event = Event.new(event_params) 
		if @event.save
			redirect_to customer_events_path(params[:customer_id])
		else
			render 'new'
		end
	end
	
	
	def edit
		@customer = Customer.find(params[:customer_id])
		@event = Event.find(params[:id])
	end
		
	def show
		@customer = Customer.find(params[:customer_id])
		@event = Event.find(params[:id])
		@event_users_accepted = EventsUser.where(:event_id => params[:id], :status => 1)
		@event_users_denied = EventsUser.where(:event_id => params[:id], :status => 0)
		
	end
		
	def destroy
		@event = Event.find(params[:id])
		@event.destroy
 
		redirect_to customer_events_path
	end
	
	def update
		@customer = Customer.find(params[:customer_id])
		@event = Event.find(params[:id])
 
		if @event.update(event_params)
			redirect_to customer_event_path
		else
			render 'edit'
		end
	end

	private
	
		def event_params
			params.require(:event).permit(:title, :date, :time, :location, :details, :customer_id, :should_respond, :status)
		end
end
