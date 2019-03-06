class AddTotalToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :total, :decimal, precision: 5, scale: 2
  end
end
