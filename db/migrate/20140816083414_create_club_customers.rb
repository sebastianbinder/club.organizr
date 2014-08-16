class CreateClubCustomers < ActiveRecord::Migration
  def change
    create_table :club_customers do |t|
      t.string :name
      t.string :street
      t.string :zipcode
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
