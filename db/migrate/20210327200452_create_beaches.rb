class CreateBeaches < ActiveRecord::Migration[6.1]
  def change
    create_table :beaches do |t|
      t.text :name
      t.text :street
      t.text :city
      t.text :parking
      


      t.timestamps null: false
    end
  end
end
