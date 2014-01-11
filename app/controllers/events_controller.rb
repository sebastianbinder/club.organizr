class EventsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :find_customer
	load_and_authorize_resource
	
	def index
		@events = @customer.events
		
	end
	
	def new
		@event = @customer.events.new(:customer_id => params[:customer_id])
	end
	
	def create
		@event = @customer.events.new(event_params) 
		if @event.save
			redirect_to customer_event_path(@customer, @event)
		else
			render 'new'
		end
	end
	
	
	def edit
		@event = @customer.events.find(params[:id])
	end
		
	def show
		@event = @customer.events.find(params[:id])
		@event_users_accepted = EventsUser.where(:event_id => params[:id], :status => 1)
		@event_users_denied = EventsUser.where(:event_id => params[:id], :status => 0)
		
	end
		
	def destroy
		@event = @customer.events.find(params[:id])
		@event.destroy
 
		redirect_to customer_events_path(@customer)
	end
	
	def update
		@event = @customer.events.find(params[:id])
 
		if @event.update(event_params)
			redirect_to customer_event_path(@customer, @event)
		else
			render 'edit'
		end
	end

	private
		def find_customer
			@customer = Customer.find(params[:customer_id])
		end
		def event_params
			params.require(:event).permit(:title, :date, :time, :location, :details, :customer_id, :should_respond, :status)
		end
end
