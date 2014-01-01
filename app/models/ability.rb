class Ability
	include CanCan::Ability

	def initialize(current_user, params)
	
		user = CustomerUser.where(:user_id => current_user.id).first
		
		if user.role? :admin
			can :manage, :all
		
		else
			
			if params[:customer_id].nil?

				user = CustomerUser.where(:user_id => current_user.id).first
				
				if user.nil?
					user = CustomerUser.new
				end
			
			else
			
				user = CustomerUser.where(:user_id => current_user.id, :customer_id => params[:customer_id]).first
			
				if user.nil?
					user = CustomerUser.new
				end
			
			end
	    
	    
	    	    	
			if user.role? :viewer
				can :index, Customer
				can :read, Event
	    		can :show, User, :id => current_user.id
				can :update, User, :id => current_user.id
			end	
	    
			if user.role? :member
				can :update, EventUser
				can :read, CustomerUser
			end	
	    
			if user.role? :organizer
	    		can :manage, Event
				can :update, EventUser
				can :see_date, EventUser
			end	
		
			if user.role? :customer

			end
	    
		end    
	end
end
