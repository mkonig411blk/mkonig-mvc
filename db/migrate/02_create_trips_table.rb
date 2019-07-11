class CreateTripsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :location
      t.date :start_date
      t.date :end_date
      t.string :attendees
      t.string :transportation
      t.integer :user_id
    end
  end
end
