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
	
  def bootstrap_button(type, size, icon)
    button_tag(type: 'button', class: "btn btn-#{type} btn-#{size}") do
      content_tag(:span, '', class: "glyphicon glyphicon-#{icon}")
    end
  end
  
  def link_to_new(object)
    if can? :create, object
      link_to(('new_' + object.to_s).to_sym) do
        bootstrap_button('success', 'sm', 'plus')
      end
    end
  end
  
  def link_to_show(object, id)
    if can? :show, object
      link_to(controller: object.to_s.pluralize, action: 'show', id: id) do
        bootstrap_button('info', 'sm', 'info-sign')
      end
    end
  end
  
  def link_to_edit(object, id)
    if can? :update, object
      link_to(controller: object.to_s.pluralize, action: 'edit', id: id) do
        bootstrap_button('warning', 'sm', 'wrench')
      end
    end
  end
	
	def get_controller
	  params[:controller]
  end
  
  def get_action
    params[:action]
  end
	
end
