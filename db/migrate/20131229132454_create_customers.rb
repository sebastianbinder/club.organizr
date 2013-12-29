class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :street
      t.string :street_number
      t.string :zipcode
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
