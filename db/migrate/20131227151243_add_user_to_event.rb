class AddUserToEvent < ActiveRecord::Migration
  def change
  	create_table :events_users do |t|
	  t.belongs_to :event
	  t.belongs_to :user
      t.integer :status
      t.datetime :updated_at
      t.timestamps
     end
  end
end
