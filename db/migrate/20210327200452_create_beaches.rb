class CreateBeaches < ActiveRecord::Migration[6.1]
  def change
    create_table :beaches do |t|

      t.timestamps
    end
  end
end
