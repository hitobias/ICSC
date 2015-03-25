class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name
      t.date :deadline
      t.text :announcement
      t.boolean :enabled

      t.timestamps null: false
    end
  end
end
