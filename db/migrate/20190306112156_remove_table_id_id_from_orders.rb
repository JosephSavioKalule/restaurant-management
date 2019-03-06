class RemoveTableIdIdFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :table_id_id, :integer
  end
end
