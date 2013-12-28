class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone_number
      t.string :street
      t.string :street_number
      t.string :zipcode
      t.string :city
      t.string :country
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
