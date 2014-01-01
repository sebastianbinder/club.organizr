class RenameTableEventsUsers < ActiveRecord::Migration
  def change
 	rename_table :customer_users, :customers_users
  end
end
