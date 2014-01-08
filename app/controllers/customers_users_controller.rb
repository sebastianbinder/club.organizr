class CustomersUsersController < ApplicationController


		
	before_filter :authenticate_user!
	load_and_authorize_resource
	
	
	
	def index
		@customers_users = CustomersUser.where(:customer_id => params[:customer_id]).sort_by &:id
	end
	
	
	def new
		@customer = Customer.find(params[:customer_id])
		@customers_user = CustomersUser.new(:customer_id => params[:customer_id])
	end
	
	def create
		@customer = Customer.find(params[:customer_id])
		user = User.where(email: params[:mail]).take
		if user.nil?
			@customers_user.errors.add(:mail, t(".error.mail_not_found"))
			render 'new'
		else
			@customers_user = CustomersUser.new(user_id: user.id, role: params[:customers_user][:role], customer_id: params[:customer_id]) 
			if @customers_user.save
				redirect_to customer_customers_users_path(params[:customer_id])
			else
				render 'new'
			end
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
			params.require(:customers_user).permit(:role, :mail, :customer_id)
		end

end
