class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :status
      t.references :invoice, foreign_key: true
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :qty
      t.float :total_cost

      t.timestamps
    end
  end
end
