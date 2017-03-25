class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :subtotal
      t.decimal :total
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
