class Customer < ActiveRecord::Base
	has_many :customers_user
	has_many :user, through: :customer_user
	has_many :events
	
	
end
