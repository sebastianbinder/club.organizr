class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :time
      t.string :location
      t.text :details
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :edited_by

      t.timestamps
    end
  end
end
