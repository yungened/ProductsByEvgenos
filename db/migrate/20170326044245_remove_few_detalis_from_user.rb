class RemoveFewDetalisFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :region
    remove_column :users, :country
    remove_column :users, :post_code
  end
end
