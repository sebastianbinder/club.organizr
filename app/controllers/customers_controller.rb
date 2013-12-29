class CustomersController < ApplicationController
  before_filter :authenticate_user!
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
