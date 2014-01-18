class Event < ActiveRecord::Base
	belongs_to :customer
	
	has_many :events_users
	has_many :users, :order => "lastname DESC", through: :events_users
	
	validates :title, :presence => true
	validates :from, :presence => true
	validate :event_end_cannot_be_in_the_past
	validate :event_cannot_be_in_the_past
	
	def event_end_cannot_be_in_the_past
	    if to.present? && to < from
	      errors.add(:to, "can't be in the past")
	    end
	end
	
	def event_cannot_be_in_the_past
	    if from.present? && from < Date.today
	      errors.add(:from, "can't be in the past")
	    end
	end
	
	STATUS = ["taking_place", "checking", "cancelled"]
	
end
