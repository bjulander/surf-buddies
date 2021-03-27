class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.text :location
      t.integer :age
      t.integer :skill_level

      


      t.timestamps null: false
    end
  end
end
