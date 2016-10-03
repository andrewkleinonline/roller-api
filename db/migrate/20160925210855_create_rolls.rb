class CreateRolls < ActiveRecord::Migration[5.0]
  def change
    create_table :rolls do |t|
      t.string :title
      t.integer :start_time
      t.integer :end_time
      t.string :youtube_identifier

      t.timestamps
    end
  end
end
