class AddDefaultValueToTotal < ActiveRecord::Migration[5.1]
  def change
    change_column_default :orders, :total, from: nil, to: 0
  end
end
