class CustomersController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource
  
	def index
		if can? :manage, :all
	  		$customers = Customer.all
	  	else
	  		customer_user = CustomersUser.where(:user_id => current_user.id)

	  		customer_ids = []
	  		customer_user.each do |customer_user|
	  			customer_ids << customer_user.customer_id
	  		end
	  		$customers = Customer.find(customer_ids)
	  	end
	end
	
	def new
		@customer = Customer.new
	end
	
	def create	
		@customer = Customer.new(customer_params) 
		if @customer.save
			redirect_to @customer
		else
			render 'new'
		end
	end
	
	
	def edit
		@customer = Customer.find(params[:id])
	end
	
	
	def show
    	@customer = Customer.find(params[:id])
	end
	
	
	def destroy
		@customer = Customer.find(params[:id])
		@customer.destroy
 
		redirect_to users_path
	end
	
	def update
	
		@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
			redirect_to @customer
		else
			render 'edit'
		end
	end

	
		
	private
		def customer_params
			params.require(:customer).permit(:name, :street, :street_number, :zipcode, :city, :country)
		end
end
