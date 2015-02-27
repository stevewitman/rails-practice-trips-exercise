class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :location
      t.date :date
      t.integer :cost
      t.belongs_to :users
    end
  end
end
