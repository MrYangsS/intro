class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :cost
      t.string :icon

      t.timestamps
    end
  end
end
