class Customer < ActiveRecord::Base
	has_many :customer_user
	has_many :user, through: :customer_user
	
	
end
