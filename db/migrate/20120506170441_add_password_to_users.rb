class AddPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    add_column :users, :fu_from, :datetime
    add_column :users, :fu_to, :datetime
  end
end
