class Ability
	include CanCan::Ability

	def initialize(user)
    	user ||= User.new # guest user (not logged in)
    
	    if user.is? :admin
	    	can :manage, :all
	    	
	    elsif user.is? :customer
	    	can :manage, Event
	    	can :manage, User
	    	
	    elsif user.is? :organizer
	    	can :manage, Event
	    	can :update, EventUsers, :user_id => user.id
			can :read, User
			
	    elsif user.is? :member
	    	can :read, Event
	    	can :update, EventUsers, :user_id => user.id
	    	can :update, User, :id => user.id
	    	can :read, User
	    	
	    elsif user.is? :viewer
	    
	    end
	end
end
