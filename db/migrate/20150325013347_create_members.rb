class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :no
      t.string :firstname
      t.string :lastname
      t.string :chinese_name
      t.string :gender
      t.string :relationship
      t.string :country
      t.string :church
      t.boolean :pick_up
      t.date :arrived_date
      t.time :arrived_time
      t.string :arrived_airport
      t.string :arrived_flight_no
      t.boolean :drop_off
      t.date :departed_date
      t.time :departed_time
      t.string :departed_airport
      t.string :departed_flight_no
      t.boolean :hospitality
      t.string :conference_option
      t.text :comments
      t.boolean :enabled, default: true
      t.boolean :donated, default: false

      t.timestamps null: false
    end
  end
end
