class CreateCravates < ActiveRecord::Migration[7.2]
  def change
    create_table :cravates do |t|
      t.string :name
      t.string :reference
      t.string :color
      t.decimal :price
      t.text :description
      t.string :material
      t.integer :stock

      t.timestamps
    end
  end
end
