class AddPaymentFieldstoUser < ActiveRecord::Migration
  def change
    add_column :users, :preffered_zone, :integer
    add_column :users, :card_numer, :string
    add_column :users, :expiry_date, :datetime
    add_column :users, :cvv, :integer
    add_column :users, :available_date, :datetime
  end
end
