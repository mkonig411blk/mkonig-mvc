class CreateActivitiesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :location
      t.string :address
      t.integer :duration
      t.date :day
      t.string :attendees
      t.string :transportation
      t.integer :trip_id
    end
  end
end
