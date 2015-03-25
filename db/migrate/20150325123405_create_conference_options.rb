class CreateConferenceOptions < ActiveRecord::Migration
  def change
    create_table :conference_options do |t|
      t.string :option_name
      t.integer :donate_amount
      t.string :short_code
      t.timestamps null: false
    end
  end
end
