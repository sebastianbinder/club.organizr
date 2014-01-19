module ApplicationHelper
	def get_customer(id)
		customer = Customer.find(id)
	end
	def get_admin_users
		admins = Array.new
		CustomersUser.where(:role => "admin").each do |admin|
			admins << admin.id
		end
		return admins
	end
end
