class UsersController < ApplicationController
		
	before_filter :authenticate_user!
	load_and_authorize_resource
	
	def index
		@users = User.all
	end
	
	def new
		@user = User.new
	end
	
	def create	
		@user = User.new(user_params) 
		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end
	
	
	def edit
		@user = User.find(params[:id])
	end
	
	
	def show
    	@user = User.find(params[:id])
	end
	
	
	def destroy
		@user = User.find(params[:id])
		@user.destroy
 
		redirect_to users_path
	end
	
	def update
	
		@user = User.find(params[:id])
		if needs_password?(@user, user_params)
			if @user.update(user_params)
				redirect_to @user
			else
				render 'edit'
			end
		else
			if @user.update_without_password(user_params)
				redirect_to @user
			else
				render 'edit'
			end
		end
	end

	
		
	private
	
		def needs_password?(user, user_params)
			!user_params[:password].blank?
  		end
	
		def user_params
			params.require(:user).permit(:firstname, :lastname, :email, :phone_number, :street, :street_number, :zipcode, :city, :country, :password, :password_confirmation, {:roles => []})
		end
end
