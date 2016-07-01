class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false
      t.string :email, :null => false
      t.boolean :email_confirmation, :default => false
      t.string :encrypted_password
      t.string :salt
      t.timestamps null: false
    end
  end
end
