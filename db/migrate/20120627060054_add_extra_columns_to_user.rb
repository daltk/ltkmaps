class AddExtraColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :account_status, :string
    add_column :users, :available, :string
    add_column :users, :discount, :integer
    add_column :users, :credentials, :string
    add_column :users, :facebook, :string
    add_column :users, :disclousure_signed, :string
  end
end
