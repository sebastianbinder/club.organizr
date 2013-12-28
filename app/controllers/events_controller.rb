class EventsController < ApplicationController

	before_filter :authenticate_user!
	def index
		@events = Event.all
		
		
	end
	
	def new
		@event = Event.new
	end
	
	def create	
		@event = Event.new(post_params) 
		if @event.save
			redirect_to @event
		else
			render 'new'
		end
	end
	
	
	def edit
		@event = Event.find(params[:id])
	end
	
	
	def show
		@event = Event.find(params[:id])
		@event_users_accepted = EventUsers.where(:event_id => params[:id], :status => 1)
		@event_users_denied = EventUsers.where(:event_id => params[:id], :status => 0)
		
	end
	
	
	def destroy
		@event = Event.find(params[:id])
		@event.destroy
 
		redirect_to events_path
	end
	
	def update
		@event = Event.find(params[:id])
 
		if @event.update(params[:event].permit(:title, :date, :time, :location, :details))
			redirect_to @event
		else
			render 'edit'
		end
	end

	
		
	private
		def post_params
			params.require(:event).permit(:title, :date, :time, :location, :details)
		end
end
