class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.boolean :is_paid
      t.references :table_id, foreign_key: true

      t.timestamps
    end
  end
end
