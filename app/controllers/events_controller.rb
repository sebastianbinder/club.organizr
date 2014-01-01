class EventsController < ApplicationController

	before_filter :authenticate_user!
	load_and_authorize_resource
	
	def index
		@events = Event.where(:customer_id => params[:customer_id])	
	end
	
	def new
		@event = Event.new(:customer_id => params[:customer_id])
		@form_url = customer_events_path(params[:customer_id])
	end
	
	def create	
		@event = Event.new(event_params) 
		if @event.save
			redirect_to customer_events_path(params[:customer_id])
		else
			render 'new'
		end
	end
	
	
	def edit
		@event = Event.find(params[:id])
		@form_url = customer_event_path(params[:customer_id], @event)
	end
		
	def show
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
		@event = Event.find(params[:id])
 
		if @event.update(event_params)
			redirect_to customer_event_path
		else
			render 'edit'
		end
	end

	private
	
		def event_params
			params.require(:event).permit(:title, :date, :time, :location, :details, :customer_id)
		end
end
