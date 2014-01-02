class CustomersUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :customer
	
	validates :user_id, :presence => true
	
	  
ROLES = %w[viewer member organizer customer admin]
ROLES_SELECTABLE = %w[viewer member organizer customer]

def role?(base_role)
  role.present? && ROLES.index(base_role.to_s) <= ROLES.index(role)
end


end
