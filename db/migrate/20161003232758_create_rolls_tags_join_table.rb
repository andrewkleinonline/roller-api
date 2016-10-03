class CreateRollsTagsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :rolls, :tags
  end
end
