class CreateChampions < ActiveRecord::Migration[7.1]
  def change
    create_table :champions do |t|
      t.string :name
      t.string :title
      t.string :icon

      t.timestamps
    end
  end
end
