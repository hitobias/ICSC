class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.string :country
      t.string :church
      t.string :email
      t.string :mobile
      t.string :phone
      t.string :active
      t.text :comments

      t.timestamps null: false
    end
  end
end
