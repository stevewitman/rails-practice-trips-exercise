class ChangeUsersInTrips < ActiveRecord::Migration
  def change
    rename_column :trips, :users_id, :user_id
  end
end
