class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.integer :initial_qty
      t.float :initial_price
      t.integer :current_qty
      t.float :current_price
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
