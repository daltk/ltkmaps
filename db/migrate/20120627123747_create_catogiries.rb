class CreateCatogiries < ActiveRecord::Migration
  def change
    create_table :catogiries do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
  end
end
