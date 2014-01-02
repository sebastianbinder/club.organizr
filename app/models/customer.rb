class Customer < ActiveRecord::Base
	has_many :customers_users
	has_many :users, through: :customers_users
	has_many :events
	
	validates :name, :presence => true
	
	
end
