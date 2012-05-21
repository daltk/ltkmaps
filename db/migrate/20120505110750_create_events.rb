class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :street_number
      t.string :street_name
      t.string :street_direction
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :location_radious
      t.string :created_by
      t.string :date_time
      t.string :blank_field_1
      t.string :blank_field_2
      t.string :blank_field_3
      t.string :blank_field_4
      t.string :blank_field_5

      t.timestamps
    end
  end
end
