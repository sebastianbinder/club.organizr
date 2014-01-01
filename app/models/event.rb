class Event < ActiveRecord::Base
	belongs_to :customer
	
	has_many :events_users
	has_many :users, through: :events_users
	
	validates :title, :presence => true
	validates :date, :presence => true
end
