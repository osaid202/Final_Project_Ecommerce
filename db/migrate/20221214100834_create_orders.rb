class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.date :date
      t.decimal :price
      t.integer :quantity
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
