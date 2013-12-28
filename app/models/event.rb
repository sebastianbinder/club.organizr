class Event < ActiveRecord::Base
	has_and_belongs_to_many :users
	
	validates :title, :presence => true
	validates :date, :presence => true
end
