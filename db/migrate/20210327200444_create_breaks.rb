class CreateBreaks < ActiveRecord::Migration[6.1]
  def change
    create_table :breaks do |t|

      t.timestamps
    end
  end
end
