class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.string :country
      t.string :church
      t.string :email
      t.string :mobile
      t.string :phone
      t.string :password_digest
      t.string :remember_digest
      t.string :activation_digest
      t.boolean :actived, default: false
      t.string :role
      t.text :comments

      t.datetime :actived_at
      t.timestamps null: false
    end
  end
end
