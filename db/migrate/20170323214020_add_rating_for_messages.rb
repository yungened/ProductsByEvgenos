class AddRatingForMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :rating, :decimal, default: 1.00
  end
end
