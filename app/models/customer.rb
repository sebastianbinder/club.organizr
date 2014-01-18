class Customer < ActiveRecord::Base
	has_many :customers_users
	has_many :users, :order => "lastname ASC", through: :customers_users
	has_many :events
	
	validates :name, :presence => true
	
	
end
