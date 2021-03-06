class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

before_filter :set_locale

before_filter :set_post_params

def set_post_params
  resource = controller_name.singularize.to_sym
  method = "#{resource}_params"
  params[resource] &&= send(method) if respond_to?(method, true)
end

def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
end

protect_from_forgery with: :exception


def default_url_options(options={})
  logger.debug "default_url_options is passed options: #{options.inspect}\n"
  { :locale => I18n.locale }
   end


 rescue_from CanCan::AccessDenied do |exception|
   redirect_to :back, :alert => exception.message
 end
 


private
  
  def current_ability
    @current_ability ||= Ability.new(current_user, params)
  end  
end
