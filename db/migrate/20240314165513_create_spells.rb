class CreateSpells < ActiveRecord::Migration[7.1]
  def change
    create_table :spells do |t|
      t.integer :champion_id
      t.string :name
      t.text :description
      t.string :icon

      t.timestamps
    end
  end
end
