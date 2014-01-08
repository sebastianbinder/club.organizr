class AddRespondToEvent < ActiveRecord::Migration
  def change
  	add_column :events, :should_respond, :boolean, :default => false
  end
end
