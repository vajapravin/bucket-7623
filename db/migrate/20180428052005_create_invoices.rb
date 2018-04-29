class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.float :total
      t.string :serial_no
      t.float :ship_cost
      t.float :unit_cost
      t.string :shipping_address
      t.integer :shipping_zip
      t.string :shipping_state
      t.string :shipping_flat
      t.string :shipping_country
      t.string :contact_person
      t.string :contact_phone

      t.timestamps
    end
  end
end
