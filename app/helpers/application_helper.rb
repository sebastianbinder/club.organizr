module ApplicationHelper
	def get_customer(id)
		customer = Customer.find(id)
	end
end
