class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.text :private, default: "Yes"
      t.text :phone_number, default: "N/A"
      t.text :location, default: "N/A"
      t.text :skill_level, default: "Kook"
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
