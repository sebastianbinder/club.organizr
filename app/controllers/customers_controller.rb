class CustomersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
  	$customers = Customer.all
  end

  def show
  end

  def edit
  end

  def new
  end
end
