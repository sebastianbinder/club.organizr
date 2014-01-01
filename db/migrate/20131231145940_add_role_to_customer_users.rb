class AddRoleToCustomerUsers < ActiveRecord::Migration
  def change
    add_column :customer_users, :role, :string
    remove_column :customer_users, :roles_mask, :string
  end
end
