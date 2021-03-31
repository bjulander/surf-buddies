class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :username
      t.string :password_digest
      
      t.timestamps null: false
    end
  end
end
