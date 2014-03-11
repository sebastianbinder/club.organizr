class CustomersUsersController < ApplicationController


		
	before_filter :authenticate_user!
	before_filter :find_customer
	load_and_authorize_resource
	
	
	
	def index
		@customers_users = @customer.users
		logger.debug @customers_users.inspect
		@customers_users_self = @customer.customers_users
	end
	
	
	def new
		@customers_user = @customer.customers_users.new
	end
	
	def create
		user = User.where(email: params[:mail]).take
		if user.nil?
			@customers_user.errors.add(:mail, t(".error.mail_not_found"))
			render 'new'
		else
			@customers_user = @customer.customers_users.new(user_id: user.id, role: params[:customers_user][:role]) 
			if @customers_user.save
				redirect_to customer_customers_users_path(@customer, @customer_user)
			else
				render 'new'
			end
		end
	end
	
	
	def edit
		@customers_user = @customer.customers_users.find(params[:id])
	end
	
	
	def show
    	@customers_user = @customer.customers_users.find(params[:id])
	end
	
	
	def destroy
		@customers_user = @customer.customers_users.find(params[:id])
		@customers_user.destroy
 
		redirect_to customer_customers_users_path(@customer)
	end

	def update
		@customer = Customer.find(params[:customer_id])
		@customers_user = CustomersUser.find(params[:id])
		if @customers_user.update(customers_user_params)
			redirect_to customer_customers_user_path(@customer, @customers_user)
		else
			render 'edit'
		end
	end

	
		
	private
		def find_customer
			@customer = Customer.find(params[:customer_id])
		end
		def customers_user_params
			params.require(:customers_user).permit(:role, :mail, :customer_id)
		end

end
