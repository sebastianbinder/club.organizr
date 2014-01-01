class CustomersUsersController < ApplicationController


		
	before_filter :authenticate_user!
	load_and_authorize_resource
	
	
	
	def index
		@customers_users = CustomersUser.where(:customer_id => params[:customer_id])
	end
	
	
	def new
		@customer = Customer.find(params[:customer_id])
		@customers_user = CustomersUser.new(:customer_id => params[:customer_id])
	end
	
	def create
		@customer = Customer.find(params[:customer_id])
		@customers_user = CustomersUser.new(customers_user_params) 
		if @customers_user.save
			redirect_to customer_customers_users_path(params[:customer_id])
		else
			render 'new'
		end
	end
	
	
	def edit
		@customer = Customer.find(params[:customer_id])
		@customers_user = CustomersUser.find(params[:id])
	end
	
	
	def show
    	@customers_user = CustomersUser.find(params[:id])
	end
	
	
	def destroy
		@customers_user = CustomersUser.find(params[:id])
		@customers_user.destroy
 
		redirect_to customer_customers_users_path
	end

	def update
		@customer = Customer.find(params[:customer_id])
		@customers_user = CustomersUser.find(params[:id])
		if @customers_user.update(customers_user_params)
			redirect_to customer_customers_user_path
		else
			render 'edit'
		end
	end

	
		
	private
		def customers_user_params
			params.require(:customers_user).permit(:role, :user_id, :customer_id)
		end

end
