class AddMobileAndDobToUser < ActiveRecord::Migration
  def change
  	add_column :users, :dob, :string  
  	add_column :users, :mobile, :string
  	add_column :events, :public, :boolean
  end
end
