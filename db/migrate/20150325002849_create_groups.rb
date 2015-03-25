class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :no_of_applicants
      t.integer :donate_amount
      t.boolean :edible
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :groups, :users
  end
end
