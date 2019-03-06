class AddTableRefToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :table, foreign_key: true
  end
end
