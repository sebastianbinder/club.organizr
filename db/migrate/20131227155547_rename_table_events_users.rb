class RenameTableEventsUsers < ActiveRecord::Migration
  def change
  	rename_table :events_users, :event_users
  end
end
