class RemoveUnusedFields < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :subtotal
    remove_column :orders, :total
  end
end
