class EventUsersController < ApplicationController
	
	before_filter :authenticate_user!
	#load_and_authorize_resource
	
	def update
		@Event_Users = EventUsers.find_or_create_by(event_id: params[:id], user_id: current_user.id)
		if @Event_Users.update("status" => params[:status])
			redirect_to customer_events_path
		else
			render 'edit'
		end
	end
	
	private
		
	def post_params
		params.fetch(:event_users).permit(:event_id, :user_id, :status)
	end
end
