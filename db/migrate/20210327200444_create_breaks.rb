class CreateBreaks < ActiveRecord::Migration[6.1]
  def change
    create_table :breaks do |t|
      t.text :location
      t.text :name
      t.text :break_type
      t.text :direction
      t.text :height
      t.text :water_level
      t.text :suggested_skill_level
      t.integer :shakas
      t.integer :user_id
      t.integer :beach_id
      
      t.timestamps null: false
    end
  end
end
