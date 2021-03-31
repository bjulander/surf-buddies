class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :username
      t.string :password_digest
      t.text :phone_number, default: "N/A"
      t.text :location, default: "N/A"
      t.integer :skill_level
      t.integer :private

      


      t.timestamps null: false
    end
  end
end
