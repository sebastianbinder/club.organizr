class EventsController < ApplicationController

	before_filter :authenticate_user!
	load_and_authorize_resource
	
	def index
		@events = Event.where(:customer_id => params[:customer_id])	
	end
	
	def new
		@event = Event.new
	end
	
	def create	
		@event = Event.new(post_params) 
		if @event.save
			redirect_to customer_events_path
		else
			render 'new'
		end
	end
	
	
	def edit
		@event = Event.find(params[:id])
	end
		
	def show
		@event = Event.find(params[:id])
		@event_users_accepted = EventUser.where(:event_id => params[:id], :status => 1)
		@event_users_denied = EventUser.where(:event_id => params[:id], :status => 0)
		
	end
		
	def destroy
		@event = Event.find(params[:id])
		@event.destroy
 
		redirect_to customer_events_path
	end
	
	def update
		@event = Event.find(params[:id])
 
		if @event.update(params[:event].permit(:title, :date, :time, :location, :details))
			redirect_to customer_event_path
		else
			render 'edit'
		end
	end

	private
	
		def post_params
			params.require(:event).permit(:title, :date, :time, :location, :details)
		end
end
