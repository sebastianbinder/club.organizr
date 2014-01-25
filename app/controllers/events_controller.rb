class EventsController < ApplicationController
before_filter :authenticate_user_from_token!
	before_filter :authenticate_user!
	before_filter :find_customer
	load_and_authorize_resource :except => [:feed]
	
	def index
		@events = @customer.events.where('`events`.`to` > ?', 5.days.ago).order(from: :asc)
		
	end
	
	def new
		@event = @customer.events.new(:customer_id => params[:customer_id])
	end
	
	def create
		@event = @customer.events.new(event_params) 
		if @event.save
			@customer.customers_users.each do |customers_user|
				EventsUser.find_or_create_by(event_id: @event.id, user_id: customers_user.id)
			end
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
		@event_users_accepted = User.joins(:events_users).where(:events_users => {:event_id => @event, :status => 1}).order('lastname ASC')
		@event_users_denied = User.joins(:events_users).where(:events_users => {:event_id => @event, :status => 0}).order('lastname ASC')
		@event_users_noreply = User.joins(:events_users).where(:events_users => {:event_id => @event, :status => nil}).order('lastname ASC')
		
	end
		
	def destroy
		@event = @customer.events.find(params[:id])
		@event.destroy
 
		redirect_to customer_events_path(@customer)
	end
	
	def update
		@event = @customer.events.find(params[:id])
 
		if @event.update(event_params)
			@customer.customers_users.each do |customers_user|
				EventsUser.find_or_create_by(event_id: @event.id, user_id: customers_user.id)
			end
			redirect_to customer_event_path(@customer, @event)
		else
			render 'edit'
		end
	end
	
	def feed
		user = User.find_by_email(params[:email])
		denied_events = EventsUser.where(:user_id => user.id, :status => 0)
		denied_events_id = []
		denied_events.each do |denied_event|
			denied_events_id << denied_event.event_id
		end
		if denied_events_id.empty?
			@events = @customer.events
		else
			@events = @customer.events.where(["id NOT IN (?)", denied_events_id])
		end
		
	end

	private
		def find_customer
			@customer = Customer.find(params[:customer_id])
		end
		def event_params
			params.require(:event).permit(:title, :from, :to, :location, :details, :customer_id, :should_respond, :status)
		end
		
		def authenticate_user_from_token!
		    user_email = params[:email].presence
		    user       = user_email && User.find_by_email(user_email)
		 
		    # Notice how we use Devise.secure_compare to compare the token
		    # in the database with the token given in the params, mitigating
		    # timing attacks.
		    if user && Devise.secure_compare(user.authentication_token, params[:token])
		      sign_in user, store: false
		    end
	    end
end
