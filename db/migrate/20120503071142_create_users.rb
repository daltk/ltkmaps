class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :role
      t.string :category
      t.string :game
      t.string :skill_level
      t.string :specialization
      t.integer :street_number
      t.string :street_name
      t.string :street_direction
      t.string :city
      t.string :state
      t.string :zipcode_1
      t.string :zipcode_2
      t.string :phone
      t.string :email
      t.integer :fu_street_number
      t.string :fu_street_name
      t.string :fu_street_direction
      t.string :fu_city
      t.string :fu_state
      t.string :fu_zipcode_1
      t.string :blank_field_1
      t.string :blank_field_2
      t.string :blank_field_3
      t.string :blank_field_4
      t.string :blank_field_5

      t.timestamps
    end
  end
end
