class CreateRolls < ActiveRecord::Migration[5.0]
  def change
    create_table :rolls do |t|

      t.timestamps
    end
  end
end
