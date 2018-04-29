class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :unit
      t.string :sku
      t.string :supplier
      t.integer :discount

      t.timestamps
    end
  end
end
