class Ability
	include CanCan::Ability

	def initialize(current_user, params)
	
		user = CustomersUser.where(:user_id => current_user.id).first
		
		if user.nil?
			user = CustomersUser.new
			can :index, Customer
		end
				
		if user.role? :admin
			can :manage, :all
		
		else
			
			if params[:customer_id].nil?

				user = CustomersUser.where(:user_id => current_user.id).first
				if user.nil?
					user = CustomersUser.new
				end	
			else
			
				user = CustomersUser.where(:user_id => current_user.id, :customer_id => params[:customer_id]).first
				if user.nil?
					user = CustomersUser.new
				end
			end
	    
			
				    	    	
			if user.role? :viewer
				can :index, Customer
				can :read, Event
	    		can :show, User, :id => current_user.id
				can :update, User, :id => current_user.id
			end	
	    
			if user.role? :member
				can :ics, Event
				can :update, EventsUser
				can :read, CustomersUser
			end	
	    
			if user.role? :organizer
	    		can :manage, Event
				can :update, EventsUser
				can :manage, CustomersUser
				can :see_date, EventsUser
			end	
		
			if user.role? :customer
				can :show, Customer
			end
			
			
	    
		end    
	end
end
