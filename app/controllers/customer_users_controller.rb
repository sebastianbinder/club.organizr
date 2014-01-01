class CustomerUsersController < ApplicationController


		
	before_filter :authenticate_user!
	load_and_authorize_resource
	
	def index
		@customer_users = CustomerUser.where(:customer_id => params[:customer_id])
	end
	
	def new
		@customer_user = CustomerUser.new
	end
	
	def create	
		@customer_user = CustomerUser.new(post_params) 
		if @customer_user.save
			redirect_to @customer_user
		else
			render 'new'
		end
	end
	
	
	def edit
		@customer_user = CustomerUser.find(params[:id])
	end
	
	
	def show
    	@customer_user = CustomerUser.find(params[:id])
	end
	
	
	def destroy
		@customer_user = CustomerUser.find(params[:id])
		@customer_user.destroy
 
		redirect_to customer_customer_users_path
	end
	
	def update
	
		@customer_user = CustomerUser.find(params[:id])
		if @customer_user.update(post_params)
			redirect_to customer_customer_user_path
		else
			render 'edit'
		end
	end

	
		
	private
		def post_params
			params.require(:customer_user).permit(:role)
		end

end
