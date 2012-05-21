class AddUserIdandEventIdtoLocations < ActiveRecord::Migration
  def change
    add_column :locations, :user_id, :integer
    add_column :locations, :event_id, :integer
  end
end
