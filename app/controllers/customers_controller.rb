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

  def show
  end

  def edit
  end

  def new
  end
end
