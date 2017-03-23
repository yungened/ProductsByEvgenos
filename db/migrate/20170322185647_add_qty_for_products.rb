class AddQtyForProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :qty, :integer
  end
end
